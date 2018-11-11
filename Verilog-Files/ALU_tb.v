`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:38:27 10/29/2018
// Design Name:   ALU
// Module Name:   E:/FPGA/CPU/ALU_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [2:0] AluControl;
	reg [31:0] in_a;
	reg [31:0] in_b;

	// Outputs
	wire [31:0] out;
	wire zeroflag;
	wire signflag;
	wire carryflag;
	wire overflowflag;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.AluControl(AluControl),
		.in_a(in_a), 
		.in_b(in_b), 
		.out(out), 
		.zeroflag(zeroflag), 
		.signflag(signflag), 
		.carryflag(carryflag), 
		.overflowflag(overflowflag)
	);

	initial begin
		// Initialize Inputs
		AluControl = 3'b100;
		in_a = 32'd32;
		in_b = 32'd2;

		// Wait 100 ns for global reset to finish
		#100;
      
		#10;
		AluControl = 3'b101;
		// Add stimulus here

	end
      
endmodule

