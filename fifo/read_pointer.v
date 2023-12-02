`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:40:12 07/06/2023 
// Design Name: 
// Module Name:    read_pointer 
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
// Verilog code for Read Pointer sub-module 

 module read_pointer(rptr, fifo_rd, fifo_citajVise, rd_edge, fifo_empty, clk, rst_edge, citaj, citajVise);

  input rd_edge, fifo_empty, clk, rst_edge, citaj, citajVise;

  output reg [3:0] rptr;  

  output fifo_rd, fifo_citajVise;  

  assign fifo_rd = (~fifo_empty)& citaj;

  assign fifo_citajVise = (~fifo_empty)& citajVise;


  always @(posedge clk or posedge rst_edge) begin

   if(rst_edge) 

	 rptr <= 0;

   else if(fifo_rd || fifo_citajVise)

    rptr <= rptr + 1;  

   else  

    rptr <= rptr;  
  
  end

 endmodule 