`timescale 1ns / 1ps
/*Assignment No. 7
  Semester 5
  Group No. 13
  Members : 
  		Arpit Jain (16CS10007)
		Eeshan Gupta (16CS30009)
*/
module shifter(
	in, shift, out, direction, signex  
    );
	input [31:0] in;
	input [4:0] shift;
	output [31:0] out;
	input direction;
	input signex;
	assign f = signex & in[31];
	
	wire [31:0] imd1, imd2, imd3, imd4, out1, out2, out3, out4, out5;
	Mux Mux1({in[30:0],1'b0}, {{1{f}},in[31:1]},out1, direction);
	Mux Mux2(in,out1,imd1,shift[0]);
	Mux Mux3({imd1[29:0],2'b0}, {{2{f}},imd1[31:2]},out2,direction);
	Mux Mux4(imd1,out2,imd2,shift[1]);
	Mux Mux5({imd2[27:0],4'b0}, {{4{f}},imd2[31:4]},out3,direction);
	Mux Mux6(imd2,out3,imd3,shift[2]);
	Mux Mux7({imd3[23:0],8'b0}, {{8{f}},imd3[31:8]},out4,direction);
	Mux Mux8(imd3,out4,imd4,shift[3]);
	Mux Mux9({imd4[15:0],16'b0}, {{16{f}},imd4[31:16]},out5,direction);
	Mux Mux10(imd4,out5,out,shift[4]);
endmodule
