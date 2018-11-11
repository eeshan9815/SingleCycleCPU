`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:29:48 10/31/2018
// Design Name:   InstructionMemory
// Module Name:   E:/FPGA/CPU/InstructionMemory_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_tb;

	// Inputs
	reg reset;
	reg [31:0] read_addr;
	reg clock;

	// Outputs
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.reset(reset), 
		.read_addr(read_addr), 
		.instruction(instruction), 
		.clock(clock)
	);
	integer i;
	initial begin
		// Initialize Inputs
		reset = 0;
		read_addr = 32'd0;
		clock = 0;
		
		// Wait 100 ns for global reset to finish
		#95;

		for(i=0; i<100; i=i+1)
		begin
			#10;
			read_addr = read_addr + 4;
		end
		// Add stimulus here

	end
   always #5 clock = ~clock;
endmodule

