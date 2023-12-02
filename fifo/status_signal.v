`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:26:56 07/06/2023 
// Design Name: 
// Module Name:    status_signal 
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
// Verilog code for Status Signals sub-module 

 module status_signal(fifo_full, fifo_empty, fifo_threshold, error, wr_edge, rd_edge, read_more_edge, fifo_we, fifo_rd, citajVise, wptr, rptr, clk, rst_edge);  

  input wr_edge, rd_edge, fifo_we, fifo_rd, citajVise, read_more_edge, clk,rst_edge;  

  input[3:0] wptr, rptr;  

  output fifo_full, fifo_empty, fifo_threshold, error;  

  wire fbit_comp;

  wire set_error;  

  wire pointer_equal;  

  wire[3:0] pointer_result;  

  reg fifo_full, fifo_empty, fifo_threshold, error;  


  assign fbit_comp = wptr[3] ^ rptr[3];  

  assign pointer_equal = (wptr[2:0] - rptr[2:0]) ? 0:1;  

  assign pointer_result = wptr[3:0] - rptr[3:0];  

  assign set_error = ((fifo_full & wr_edge) || (fifo_empty & (rd_edge || read_more_edge))) ? 1 : 0;  


  always @(*) begin  

   fifo_full =fbit_comp & pointer_equal;  

   fifo_empty = (~fbit_comp) & pointer_equal;  

   fifo_threshold = (pointer_result[3]||pointer_result[2]) ? 1:0;  

  end  


  always @(posedge clk or posedge rst_edge) begin  

  if(rst_edge)

   error <=0;  

  else if(((set_error==1)&&(fifo_rd==0)) || ((set_error==1)&&(fifo_we==0)) || (citajVise & (fifo_empty)))  

   error<=1;  

   else if(fifo_rd || fifo_we || (citajVise & (~fifo_empty)) || (citajVise & (~fifo_full))) 

    error <=0;  

    else  

     error <= error;  

  end

 endmodule  

