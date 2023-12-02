`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:15:09 07/06/2023 
// Design Name: 
// Module Name:    push_pop 
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
// Verilog code for Push i Pop Pointers sub-module 


 module push_pop #(parameter DATA_WIDTH=4, parameter STACK_DEPTH=16)(push_edge, citaj, citajVise, stack_citajVise, stack_pop, stack_push, stack_full, stack_empty, clk, rst_edge, sp);  

  input citaj, citajVise, push_edge, stack_empty, stack_full, clk, rst_edge;  

  output reg[7:0] sp = 0;  

  output stack_pop, stack_push, stack_citajVise ;
  
  
  assign stack_push = (~stack_full)& push_edge; 

  assign stack_pop = (~stack_empty)& citaj;  
  
  assign stack_citajVise = (~stack_empty)& citajVise;

  always @(posedge clk or posedge rst_edge) begin  

   if(rst_edge) 
	
	 sp <= 0;  

   else begin
	
	 if(stack_push)

     sp <= sp + 1;  

    else if(stack_pop || stack_citajVise)

     sp <= sp - 1;  
	  
	 else
	 
	  sp <= sp;
	  
	end
	
  end  

 endmodule  
