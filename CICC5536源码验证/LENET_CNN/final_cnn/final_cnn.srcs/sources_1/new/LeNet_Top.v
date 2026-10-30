`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/15 16:23:02
// Design Name: 
// Module Name: LeNet_Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module LeNet_Top(
input [4703:0] data,
output [7:0] result
);
reg [1295:0] weight1;
reg [47:0] bias1;
wire [6911:0] cov_result1;
wire [1727:0] result1, result1_activation;

reg [1295:0] weight2;
reg [23:0] bias2;
wire [383:0] cov_result2;
wire [95:0] result2, result2_activation;

reg [1919:0] weight3;
reg [159:0] bias3;
wire [159:0] result3;

reg [159:0] weight4;
reg [7:0] bias4;
wire [7:0]result_pre=8'd0;//初始化
Conv2d#(8, 14, 14, 3, 3, 3, 6, 1, 1, 0) conv2d_1(data, weight1, bias1, cov_result1);
Max_pool#(8, 12, 12, 6, 2, 2) max_pool_1(cov_result1, result1);
Relu_activation#(8, 6, 6, 6) relu_activation_1(result1, result1_activation);

Conv2d#(8, 6, 6, 6, 3, 3, 3, 1, 1, 0) conv2d_2(result1_activation, weight2, bias2, cov_result2);
Max_pool#(8, 4, 4, 3, 2, 2) max_pool_2(cov_result2, result2);
Relu_activation#(8, 2, 2, 3) relu_activation_2(result2, result2_activation);

FullConnect#(8, 12, 20) fullConnect_1(result2_activation, weight3, bias3, result3);

FullConnect#(8, 20, 1) fullConnect_2(result3, weight4, bias4, result1);
assign result=result_pre;
endmodule
