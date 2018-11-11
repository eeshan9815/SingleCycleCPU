`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:28:17 10/29/2018
// Design Name:   BranchingLogic
// Module Name:   E:/FPGA/CPU/BranchingLogic_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BranchingLogic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BranchingLogic_tb;

	// Inputs
	reg [31:0] jump_addr;
	reg zero_flag;
	reg sign_flag;
	reg carry_flag;
	reg overflow_flag;
	reg [3:0] FlagControl;
	reg BranchControl;
	reg [31:0] program_counter_in;

	// Outputs
	wire [31:0] program_counter_out;

	// Instantiate the Unit Under Test (UUT)
	BranchingLogic uut (
		.jump_addr(jump_addr), 
		.zero_flag(zero_flag),
		.sign_flag(sign_flag), 
		.carry_flag(carry_flag), 
		.overflow_flag(overflow_flag), 
		.FlagControl(FlagControl),
		.BranchControl(BranchControl), 
		.program_counter_in(program_counter_in), 
		.program_counter_out(program_counter_out)
	);

	initial begin
		// Initialize Inputs
		jump_addr = 40;
		zero_flag = 0;
		sign_flag = 01;
		carry_flag = 0;
		overflow_flag = 01;
		FlagControl = 4'b1100;
		BranchControl = 1;
		program_counter_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

