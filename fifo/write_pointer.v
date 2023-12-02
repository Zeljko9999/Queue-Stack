`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:22:25 07/06/2023 
// Design Name: 
// Module Name:    write_pointer 
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
// Verilog code for Write Pointer sub-module 

 module write_pointer(wptr, fifo_we, wr_edge, fifo_full, clk, rst_edge);  

  input wr_edge,fifo_full,clk,rst_edge;  

  output reg[3:0] wptr;  

  output fifo_we;   

  assign fifo_we = (~fifo_full)&wr_edge;  
  

  always @(posedge clk or posedge rst_edge) begin  

   if(rst_edge) 

	 wptr <= 0;  

   else if(fifo_we)  

    wptr <= wptr + 1;  

   else  

    wptr <= wptr;  

  end

 endmodule  