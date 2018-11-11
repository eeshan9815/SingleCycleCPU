`timescale 1ns / 1ps

/*Assignment No. 7
  Semester 5
  Group No. 13
  Members : 
  		Arpit Jain (16CS10007)
		Eeshan Gupta (16CS30009)
*/
module ALU(
	input [2:0] AluControl,
	input [31:0] in_a,
	input [31:0] in_b,
	output [31:0] out,
	output zeroflag,
	output signflag,
	output carryflag,
	output overflowflag
    );
	wire[31:0] sum, compl_b, xor_out, and_out;
	wire[31:0] shift_a; 	
	wire dummy1, dummy2;
	adder A_1(in_a, in_b, 1'b0, sum, carryflag_imd, overflowflag_imd);
	adder A_2({32'b0}, ~in_b, 1'b1, compl_b, dummy1, dummy2); //TODO reduce architecture
	assign and_out = in_a & in_b;
	assign xor_out = in_a ^ in_b;
	shifter A(in_a, in_b[4:0], shift_a, AluControl[0], AluControl[1]);

	Mux_8x1 MuxALU (sum, compl_b, and_out, xor_out, shift_a, shift_a, {32'b0}, shift_a, out, AluControl);
	Mux #(1) MuxCarryFlag (carryflag_imd, 1'b0, carryflag, |AluControl);
	Mux #(1) MuxOverflowFlag (overflowflag_imd, 1'b0, overflowflag, |AluControl);
	assign zeroflag = ~|(out);
	assign signflag = out[31];
endmodule
