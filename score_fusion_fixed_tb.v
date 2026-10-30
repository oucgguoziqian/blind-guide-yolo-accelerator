`timescale 1ns / 1ps
// 简单边界测试：输入和输出均按同一缩放因子表示。
module score_fusion_fixed_tb;
    reg  [15:0] score_ux, score_uz, score_v, score_b, score_yolo;
    wire [15:0] score_final;

    score_fusion_fixed #(.SCORE_W(16)) dut (
        .score_ux(score_ux), .score_uz(score_uz), .score_v(score_v),
        .score_b(score_b), .score_yolo(score_yolo), .score_final(score_final)
    );

    initial begin
        // 全零输入仍为零，检查旧式整数除法未被引入。
        score_ux=0; score_uz=0; score_v=0; score_b=0; score_yolo=0;
        #1 if (score_final !== 0) begin $display("zero-input test failed"); $finish; end

        // 仅视觉分支时，输出应为 170/200 = 0.85。
        score_ux=0; score_uz=0; score_v=0; score_b=0; score_yolo=1000;
        #1 if (score_final !== 850) begin $display("YOLO weight test failed"); $finish; end

        // 五路输入相等时，权重和为 1，输出应保持原值。
        score_ux=777; score_uz=777; score_v=777; score_b=777; score_yolo=777;
        #1 if (score_final !== 777) begin $display("weight-sum test failed"); $finish; end

        $display("score_fusion_fixed tests passed");
        $finish;
    end
endmodule
