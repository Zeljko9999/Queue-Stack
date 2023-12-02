`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

// Company: 

// Engineer: 

// Create Date:    17:09:59 06/05/2023 

// Design Name: 

// Module Name:    fifo 

// Project Name: 

// Target Devices: 

// Tool versions: 

// Description:

// Dependencies:

// Revision:

// Revision 0.01 - File Created

// Additional Comments: 

//////////////////////////////////////////////////////////////////////////////////

// Verilog project: Verilog code for FIFO memory

 module fifo(data_out,fifo_full, fifo_empty, fifo_threshold, error, clk, rst, wr, rd, read_more, data_in);  

  input wr, rd, clk, rst, read_more;  

  input[3:0] data_in;

  output[3:0] data_out;  

  output fifo_full, fifo_empty, fifo_threshold, error;  

  wire[3:0] wptr,rptr;  

  wire fifo_we, fifo_rd, citaj, citajVise, fifo_citajVise;   

  wire deb_rst, deb_wr, deb_rd, deb_read_more, wr_edge, rd_edge, rst_edge, read_more_edge;

  
  debounce wr_debounce(.pb_1(wr), .clk(clk), .pb_out(deb_wr));

  debounce rd_debounce(.pb_1(rd), .clk(clk), .pb_out(deb_rd));

  debounce rst_debounce(.pb_1(rst), .clk(clk), .pb_out(deb_rst));

  debounce read_more_debounce(.pb_1(read_more), .clk(clk), .pb_out(deb_read_more));


  edge_detector edge_det_wr (.sig(deb_wr), .clk(clk), .edgee(wr_edge));

  edge_detector edge_det_rd (.sig(deb_rd), .clk(clk), .edgee(rd_edge));

  edge_detector edge_det_rst (.sig(deb_rst), .clk(clk), .edgee(rst_edge));

  edge_detector edge_det_read_more (.sig(deb_read_more), .clk(clk), .edgee(read_more_edge));


  write_pointer top1(wptr, fifo_we, wr_edge, fifo_full, clk, rst_edge);  

  read_pointer top2(rptr, fifo_rd, fifo_citajVise, rd_edge, fifo_empty, clk, rst_edge, citaj, citajVise);  

  memory_array top3(data_out, data_in, clk, rst_edge, fifo_we, fifo_rd, fifo_citajVise, wptr, rptr);  

  status_signal top4(fifo_full, fifo_empty, fifo_threshold, error, wr_edge, rd_edge, read_more_edge, fifo_we, fifo_rd, citajVise, wptr, rptr, clk, rst_edge); 

  brojacTaktova top5(rd_edge, read_more_edge, clk, rst_edge, data_in, citaj, citajVise, fifo_empty);  

 endmodule  