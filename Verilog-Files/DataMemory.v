`timescale 1ns / 1ps

/*Assignment No. 7
  Semester 5
  Group No. 13
  Members : 
  		Arpit Jain (16CS10007)
		Eeshan Gupta (16CS30009)
*/
module DataMemory(
		read_write_addr,
		write_data,
		read_data,
		MemWrite,
		clock
	);

	input [31:0] read_write_addr;
	input [31:0] write_data;
	input MemWrite;
	output [31:0] read_data;
	input clock;
	
	/*
	bram1 DMemory (
	  .clka(clock), // input clka
	  .rsta({1'b0}), // input rsta
	  .wea(MemWrite), // input [0 : 0] wea
	  .addra(read_write_addr[8:0]), // input [8 : 0] addra
	  .dina(write_data), // input [31 : 0] dina
	  .douta(read_data) // output [31 : 0] douta
	);
	*/
	
	reg [31:0] DMemory [31:0];
	
	assign read_data = DMemory[read_write_addr[4:0]];

	always @(posedge clock)
	begin
		if(MemWrite)
			DMemory[read_write_addr[4:0]] <= write_data;
	end
	
endmodule
