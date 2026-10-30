`timescale 1ns / 1ps
//
// 传感器与视觉得分融合模块（修正版）
//
// 旧式写法把“5 除以 200”等整数常量除法放在乘法因子中，
// Verilog 会先计算整数商并截断为 0，导致小权重分支被丢弃。
// 本模块把所有权重写成同一分母下的整数乘加，输入和输出保持相同的定点量纲。
// 权重为：5/200、5/200、10/200、10/200、170/200，合计为 1。
//
// 使用约定：
// 1. score_ux、score_uz、score_v、score_b、score_yolo 必须使用同一固定点缩放因子。
// 2. score_final 使用相同缩放因子，不额外乘除 2^n。
// 3. 默认 SCORE_W=31，与原表达式的信号位宽一致。
//
module score_fusion_fixed #(
    parameter integer SCORE_W = 31
)(
    input  wire [SCORE_W-1:0] score_ux,
    input  wire [SCORE_W-1:0] score_uz,
    input  wire [SCORE_W-1:0] score_v,
    input  wire [SCORE_W-1:0] score_b,
    input  wire [SCORE_W-1:0] score_yolo,
    output reg  [SCORE_W-1:0] score_final
);

    // 最大权重为 170，所有输入相加后的位宽至少需要 SCORE_W+8。
    localparam integer SUM_W = SCORE_W + 8;
    localparam [SUM_W-1:0] W_UX   = 8'd5;
    localparam [SUM_W-1:0] W_UZ   = 8'd5;
    localparam [SUM_W-1:0] W_V    = 8'd10;
    localparam [SUM_W-1:0] W_B    = 8'd10;
    localparam [SUM_W-1:0] W_YOLO = 8'd170;
    localparam [SUM_W-1:0] WEIGHT_DENOM = 9'd200;

    wire [SUM_W-1:0] score_ux_ext   = {{(SUM_W-SCORE_W){1'b0}}, score_ux};
    wire [SUM_W-1:0] score_uz_ext   = {{(SUM_W-SCORE_W){1'b0}}, score_uz};
    wire [SUM_W-1:0] score_v_ext    = {{(SUM_W-SCORE_W){1'b0}}, score_v};
    wire [SUM_W-1:0] score_b_ext    = {{(SUM_W-SCORE_W){1'b0}}, score_b};
    wire [SUM_W-1:0] score_yolo_ext = {{(SUM_W-SCORE_W){1'b0}}, score_yolo};

    reg [SUM_W-1:0] weighted_sum;

    always @* begin
        weighted_sum = score_ux_ext   * W_UX
                     + score_uz_ext   * W_UZ
                     + score_v_ext    * W_V
                     + score_b_ext    * W_B
                     + score_yolo_ext * W_YOLO;
        score_final = weighted_sum / WEIGHT_DENOM;
    end

endmodule
