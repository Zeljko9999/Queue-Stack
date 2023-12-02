`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:14:01 07/06/2023 
// Design Name: 
// Module Name:    brojacTaktova 
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
// Verilog code for brojacTaktova submodule describing control of pop and read_more inputs

 module brojacTaktova #(parameter DATA_WIDTH=4, parameter STACK_DEPTH=16)(pop_edge, read_more_edge, clk, rst_edge, data_in, citaj, citajVise, stack_empty);

  input pop_edge, read_more_edge, clk, rst_edge, stack_empty;
  
  input[3:0] data_in;
 
  output reg citaj;
  
  output reg citajVise = 0;

  reg [27:0] counter;
  
  reg [3:0] brojPonavljanja;
  
  reg [3:0] iterator;
  
  reg ponavljanjeAktivno = 0;
  
  
  always @(posedge clk or posedge rst_edge) begin
   
	
	if (rst_edge) begin
	
	 citaj <= 0;
	 
	end
	
	else begin
	 
	 if (pop_edge & ponavljanjeAktivno)
	 
	  citaj <= 0;
	 
	 else if (pop_edge & ~(ponavljanjeAktivno))
	 
	  citaj <= 1;
	 
	 else if (~pop_edge)
	   
	  citaj <= 0;
	 
	 else 
	
	  citaj <= citaj;
	  
	 end
	 
	 
	 
	if (rst_edge) begin

	 citajVise <= 0;
	 ponavljanjeAktivno <= 0;
	 brojPonavljanja <= 0;
	 iterator <= 0;	
	 
	end
	 
	else begin
	 
	 if (read_more_edge) begin
	 
	   if (~stack_empty) begin
	
	     brojPonavljanja <= data_in;
	 	 
	     ponavljanjeAktivno <= 1;
	 
	     iterator <= 0;
		  
		 end
		 
		else 
		
		  ponavljanjeAktivno <= 0;
		  
	  end
	
	  else begin
	
	     if (iterator < brojPonavljanja) begin
	   
	        if ((counter == 100000000) && (ponavljanjeAktivno == 1)) begin
		 
 		       citajVise <= 1;
	  
	          iterator <= iterator + 1;
			  
		     end
			
		     else if ((ponavljanjeAktivno ==1) && (counter < 100000000)) begin 
			
			    brojPonavljanja <= brojPonavljanja;
	  
	          ponavljanjeAktivno <= ponavljanjeAktivno;
	 
	          iterator <= iterator;
			 
			    citajVise <= 0;
			
		     end
			
		   end
		  
		   else begin
		  
		  	  ponavljanjeAktivno <= 0;
	 
	        citajVise <= 0;

		   end  
		  
	   end
	
    end
	 
  end
	
	
	
  always @(posedge clk) begin
  
   if (read_more_edge)
    
	 counter <= 0;
	
	else 
	
	 counter <= counter + 1;
	 
	 
	if (counter == 100000000)
	
	 counter <= 0;
  
  end
	
	
 endmodule
 
 
