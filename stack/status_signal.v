`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:16:01 07/06/2023 
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


 module status_signal #(parameter DATA_WIDTH=4, parameter STACK_DEPTH=16)(stack_full, stack_empty, stack_threshold, error, push_edge, pop_edge, read_more_edge, stack_push, stack_pop, citajVise, sp, clk, rst_edge);  


  input push_edge, pop_edge, stack_push, stack_pop, citajVise, read_more_edge, clk, rst_edge;  

  input[7:0] sp;  

  output reg stack_full, stack_empty, stack_threshold, error;  

  wire set_error; 
  
  wire [6:0] quotient; 
  
  
  assign quotient = STACK_DEPTH >> 1;  


  assign set_error = ((stack_full & push_edge) || (stack_empty & (pop_edge || read_more_edge))) ? 1 : 0;  


  always @(*) begin  


   stack_full = (sp == STACK_DEPTH ) ? 1 : 0;  


   stack_empty = (sp == 0) ? 1 : 0; 


   stack_threshold = (sp > (quotient-1)) ? 1:0;  


  end  



  always @(posedge clk or posedge rst_edge) begin  


  if(rst_edge)

   error <=0;  

  else if(((set_error==1)&&(stack_pop==0)) || ((set_error==1)&&(stack_push==0)) || (citajVise & (stack_empty)))  

   error<=1;  

   else if(stack_pop || stack_push || (citajVise & (~stack_empty)) || (citajVise & (~stack_full))) 

    error <=0;  

    else  

     error <= error;  

  end

 endmodule  