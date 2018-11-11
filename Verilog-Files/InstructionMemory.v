`timescale 1ns / 1ps

/*Assignment No. 7
  Semester 5
  Group No. 13
  Members : 
  		Arpit Jain (16CS10007)
		Eeshan Gupta (16CS30009)
*/
//synthesis attribute box_type <bram1> "black_box"
module InstructionMemory(
		reset,
		read_addr,
		instruction,
		clock
	);

	input reset;
	input [31:0] read_addr;
	input clock;
	output [31:0] instruction;
	
	///*
	bram1 IMemory (
	  .clka(~clock), // input clka
	  .rsta({1'b0}), // input rsta
	  .wea({1'b0}), // input [0 : 0] wea
	  .addra(read_addr[10:2]), // input [8 : 0] addra
	  .dina({32'b0}), // input [31 : 0] dina
	  .douta(instruction) // output [31 : 0] douta
	);
	//*/
	
	/*
	reg [31:0] IMemory [511:0];
	// I-Memory internally stored as words (4 bytes)
	wire [8:0] underlying_read_addr;
	
	assign underlying_read_addr=read_addr[10:2];
	assign instruction = IMemory[underlying_read_addr];
	*/
endmodule
