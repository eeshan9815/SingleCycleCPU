`timescale 1ns / 1ps

/*Assignment No. 7
  Semester 5
  Group No. 13
  Members : 
  		Arpit Jain (16CS10007)
		Eeshan Gupta (16CS30009)
*/
module ProgramCounter(
		in_counter,
		out_counter,
		clock,
		reset
    );
	 input wire[31:0] in_counter;
	 output reg[31:0] out_counter;
	 input clock;
	 input reset;

	always@(posedge reset or posedge clock)
	begin
		if(reset)
			out_counter <= 32'b0;
		else
			out_counter <= in_counter;
	end

endmodule
