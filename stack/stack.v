
 `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:59 06/05/2023 
// Design Name: 
// Module Name:    stack
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
// Verilog project: Verilog code for Stack memory

 module stack(data_out, stack_full, stack_empty, stack_threshold, error, clk, rst, push, pop, read_more, data_in);  

  input push, pop, clk, rst, read_more;  

  input[3:0] data_in;

  output[DATA_WIDTH-1:0] data_out;  

  output stack_full, stack_empty, stack_threshold, error;  

  wire[7:0] sp;  

  wire stack_push, stack_pop, citaj, citajVise, stack_citajVise;   

  wire deb_rst, deb_push, deb_pop, deb_read_more, push_edge, pop_edge, rst_edge, read_more_edge;
  
  //parameters
  parameter DATA_WIDTH = 4;
  parameter STACK_DEPTH = 16;

  
  debounce wr_debounce(.pb_1(push), .clk(clk), .pb_out(deb_push));

  debounce rd_debounce(.pb_1(pop), .clk(clk), .pb_out(deb_pop));

  debounce rst_debounce(.pb_1(rst), .clk(clk), .pb_out(deb_rst));

  debounce read_more_debounce(.pb_1(read_more), .clk(clk), .pb_out(deb_read_more));
  

  edge_detector edge_det_push (.sig(deb_push), .clk(clk), .edgee(push_edge));

  edge_detector edge_det_pop (.sig(deb_pop), .clk(clk), .edgee(pop_edge));

  edge_detector edge_det_rst (.sig(deb_rst), .clk(clk), .edgee(rst_edge));
  
  edge_detector edge_det_read_more (.sig(deb_read_more), .clk(clk), .edgee(read_more_edge));


  push_pop #(DATA_WIDTH, STACK_DEPTH) top1(push_edge, citaj, citajVise, stack_citajVise, stack_pop, stack_push, stack_full, stack_empty, clk, rst_edge, sp);

  memory_array #(DATA_WIDTH, STACK_DEPTH) top2(data_out, data_in, clk, rst_edge, stack_push, stack_pop, stack_citajVise, sp);

  status_signal #(DATA_WIDTH, STACK_DEPTH) top3(stack_full, stack_empty, stack_threshold, error, push_edge, pop_edge, read_more_edge, stack_push, stack_pop, citajVise, sp, clk, rst_edge); 

  brojacTaktova #(DATA_WIDTH, STACK_DEPTH) top4(pop_edge, read_more_edge, clk, rst_edge, data_in, citaj, citajVise, stack_empty);


 endmodule  
 
