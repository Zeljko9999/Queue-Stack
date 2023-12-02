`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:14:35 07/06/2023 
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

 module memory_array #(parameter DATA_WIDTH=4, parameter STACK_DEPTH=16)(data_out, data_in, clk, rst_edge, stack_push, stack_pop, stack_citajVise, sp);  


  input[3:0] data_in;  

  input clk, stack_push, stack_pop, rst_edge, stack_citajVise;  

  input[7:0] sp; 

  output reg[DATA_WIDTH-1:0] data_out;

  reg[DATA_WIDTH-1:0] mem[0:STACK_DEPTH-1]; 
  
  reg a,b;


  always @(posedge clk) begin  
  //zakasni 1 takt
   a<=stack_pop;
	
	b<=stack_citajVise;

   if(stack_push)   

      mem[sp] <= data_in ;

	if(a || b)

      data_out <= mem[sp];
		
	if(rst_edge)
	
		data_out <= 0;

  end

 endmodule