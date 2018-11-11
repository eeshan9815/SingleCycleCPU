`timescale 1ns / 1ps

/*Assignment No. 7
  Semester 5
  Group No. 13
  Members : 
  		Arpit Jain (16CS10007)
		Eeshan Gupta (16CS30009)
*/
module RegisterBank(
	read_addr_1, read_addr_2, write_addr, write_data, RegWrite,	clock, read_data_1, read_data_2, reset
    );
	input [4:0] read_addr_1;
	input [4:0] read_addr_2;
	input [4:0] write_addr;
	input [31:0] write_data;
	input RegWrite;
	input clock;
	output [31:0] read_data_1;
	output [31:0] read_data_2;
	input reset;
	
	reg [31:0] RBank [31:0];
	
	assign read_data_1 = RBank[read_addr_1];
	assign read_data_2 = RBank[read_addr_2];

	always @(posedge clock)
	begin
	if(RegWrite)
		RBank[write_addr] <= write_data;
	end

endmodule
