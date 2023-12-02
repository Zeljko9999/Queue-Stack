`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:32:57 07/06/2023 
// Design Name: 
// Module Name:    memory_array 
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
// Verilog code for Memory Array submodule 

 module memory_array(data_out, data_in, clk, rst_edge, fifo_we, fifo_rd, fifo_citajVise, wptr, rptr);  

  input[3:0] data_in;  

  input clk, fifo_we, fifo_rd, rst_edge, fifo_citajVise;  

  input[3:0] wptr, rptr;  

  output reg[3:0] data_out;  

  reg[3:0] mem[0:7];   


  always @(posedge clk) begin  

   if(fifo_we)   

      mem[wptr[2:0]] <= data_in ;   

	if(fifo_rd || fifo_citajVise)

      data_out <= mem[rptr[2:0]];  

	if(rst_edge)

		data_out <= 0;

  end

 endmodule  
