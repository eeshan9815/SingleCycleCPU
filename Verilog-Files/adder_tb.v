`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:01:40 10/29/2018
// Design Name:   adder
// Module Name:   E:/FPGA/CPU/adder_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg cy_in;

	// Outputs
	wire [31:0] sum;
	wire carryflag;
	wire overflowflag;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.a(a), 
		.b(b), 
		.cy_in(cy_in), 
		.sum(sum), 
		.carryflag(carryflag), 
		.overflowflag(overflowflag)
	);

	initial begin
		// Initialize Inputs
		a = 32'b01111111111111111111111111111111;
		b = 32'b01111111111111111111111111111111;
		cy_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

