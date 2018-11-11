`timescale 1ns / 1ps

/*Assignment No. 7
  Semester 5
  Group No. 13
  Members : 
  		Arpit Jain (16CS10007)
		Eeshan Gupta (16CS30009)
*/

module adder(
    input [31:0] a,
    input [31:0] b,
    input cy_in,
    output [31:0] sum,
	 output carryflag,
	 output overflowflag
    );
	wire [31:0] carry; 
	full_adder FA0(a[0],b[0],cy_in,sum[0],carry[1]);
	full_adder FA1(a[1],b[1],carry[1],sum[1],carry[2]);
	full_adder FA2(a[2],b[2],carry[2],sum[2],carry[3]);
	full_adder FA3(a[3],b[3],carry[3],sum[3],carry[4]);
	full_adder FA4(a[4],b[4],carry[4],sum[4],carry[5]);
	full_adder FA5(a[5],b[5],carry[5],sum[5],carry[6]);
	full_adder FA6(a[6],b[6],carry[6],sum[6],carry[7]);
	full_adder FA7(a[7],b[7],carry[7],sum[7],carry[8]);
	full_adder FA8(a[8],b[8],carry[8],sum[8],carry[9]);
	full_adder FA9(a[9],b[9],carry[9],sum[9],carry[10]);
	full_adder FA10(a[10],b[10],carry[10],sum[10],carry[11]);
	full_adder FA11(a[11],b[11],carry[11],sum[11],carry[12]);
	full_adder FA12(a[12],b[12],carry[12],sum[12],carry[13]);
	full_adder FA13(a[13],b[13],carry[13],sum[13],carry[14]);
	full_adder FA14(a[14],b[14],carry[14],sum[14],carry[15]);
	full_adder FA15(a[15],b[15],carry[15],sum[15],carry[16]);
	full_adder FA16(a[16],b[16],carry[16],sum[16],carry[17]);
	full_adder FA17(a[17],b[17],carry[17],sum[17],carry[18]);
	full_adder FA18(a[18],b[18],carry[18],sum[18],carry[19]);
	full_adder FA19(a[19],b[19],carry[19],sum[19],carry[20]);
	full_adder FA20(a[20],b[20],carry[20],sum[20],carry[21]);
	full_adder FA21(a[21],b[21],carry[21],sum[21],carry[22]);
	full_adder FA22(a[22],b[22],carry[22],sum[22],carry[23]);
	full_adder FA23(a[23],b[23],carry[23],sum[23],carry[24]);
	full_adder FA24(a[24],b[24],carry[24],sum[24],carry[25]);
	full_adder FA25(a[25],b[25],carry[25],sum[25],carry[26]);
	full_adder FA26(a[26],b[26],carry[26],sum[26],carry[27]);
	full_adder FA27(a[27],b[27],carry[27],sum[27],carry[28]);
	full_adder FA28(a[28],b[28],carry[28],sum[28],carry[29]);
	full_adder FA29(a[29],b[29],carry[29],sum[29],carry[30]);
	full_adder FA30(a[30],b[30],carry[30],sum[30],carry[31]);
	full_adder FA31(a[31],b[31],carry[31],sum[31],carryflag);
	assign overflowflag = carryflag ^ carry[31];
endmodule
	
	
module full_adder(
		input a,
		input b,
		input c_in,
		output sum,
		output c_out
    );
	assign sum = a^b^c_in;
	assign c_out = (a&b)|(b&c_in)|(c_in&a);
endmodule