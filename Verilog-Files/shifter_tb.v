`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:44:51 10/29/2018
// Design Name:   shifter
// Module Name:   E:/FPGA/CPU/shifter_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shifter_tb;

	// Inputs
	reg [31:0] in;
	reg [4:0] shift;
	reg direction;
	reg signex;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	shifter uut (
		.in(in), 
		.shift(shift), 
		.out(out), 
		.direction(direction), 
		.signex(signex)
	);

	initial begin
		// Initialize Inputs
		in = 32'b11111111111111111111111111111101;
		shift = 1;
		direction = 1;
		signex = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

