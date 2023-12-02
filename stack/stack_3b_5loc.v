`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:16:28 07/06/2023 
// Design Name: 
// Module Name:    stack_3b_5loc 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module stack_3b_5loc(data_out, stack_full, stack_empty, stack_threshold, error, clk, rst, push, pop, read_more, data_in
    );
	 
  input push, pop, clk, rst, read_more;  

  input[3:0] data_in;

  output[3-1:0] data_out;  

  output stack_full, stack_empty, stack_threshold, error;  

stack #(.DATA_WIDTH(3), .STACK_DEPTH(5)) inst(data_out, stack_full, stack_empty, stack_threshold, error, clk, rst, push, pop, read_more, data_in);
endmodule