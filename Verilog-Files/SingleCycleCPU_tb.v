`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:34:58 11/05/2018
// Design Name:   SingleCycleCPU
// Module Name:   E:/FPGA/CPU/SingleCycleCPU_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SingleCycleCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SingleCycleCPU_tb;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire [7:0] display;

	// Instantiate the Unit Under Test (UUT)
	SingleCycleCPU uut (
		.clock(clock), 
		.reset(reset), 
		.display(display)
	);
   
	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		#240;
		reset = 1;
		#120;
		reset = 0;
		// Wait 100 ns for global reset to finish
		#4000;
        
		// Add stimulus here

	end
   always #200 clock = ~clock;
   
endmodule

