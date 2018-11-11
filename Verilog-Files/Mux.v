`timescale 1ns / 1ps
/*Assignment No. 7
  Semester 5
  Group No. 13
  Members : 
  		Arpit Jain (16CS10007)
		Eeshan Gupta (16CS30009)
*/
module Mux(
		in_1,
		in_2,
		out,
		select
    );
parameter N=32;

	input [N-1:0] in_1;
	input [N-1:0] in_2;
	output reg[N-1:0] out;
	input select;

	always@(*)
	begin
		if(select)
			out <= in_2;
		else
			out <= in_1;
	end
endmodule


module Mux_4x1(
		in_1,
		in_2,
		in_3,
		in_4,
		out,
		select
    );
parameter N=32;

	input [N-1:0] in_1;
	input [N-1:0] in_2;
	input [N-1:0] in_3;
	input [N-1:0] in_4;
	output reg[N-1:0] out;
	input [1:0] select;

	always@(*)
	begin
		if(select == 2'b11)
			out <= in_4;
		else if(select == 2'b10)
			out <= in_3;
		else if(select == 2'b01)
			out <= in_2; 
		else
			out <= in_1;
	end
endmodule


module Mux_8x1(
		in_1,
		in_2,
		in_3,
		in_4,
		in_5,
		in_6,
		in_7,
		in_8,
		out,
		select
    );
parameter N=32;

	input [N-1:0] in_1;
	input [N-1:0] in_2;
	input [N-1:0] in_3;
	input [N-1:0] in_4;
	input [N-1:0] in_5;
	input [N-1:0] in_6;
	input [N-1:0] in_7;
	input [N-1:0] in_8;
	output reg[N-1:0] out;
	input [2:0] select;

	always@(*)
	begin
		if(select == 3'b111)
			out <= in_8;
		else if(select == 3'b110)
			out <= in_7;
		else if(select == 3'b101)
			out <= in_6;
		else if(select == 3'b100)
			out <= in_5;
		else if(select == 3'b11)
			out <= in_4;
		else if(select == 3'b10)
			out <= in_3;
		else if(select == 3'b01)
			out <= in_2; 
		else
			out <= in_1;
	end
endmodule
