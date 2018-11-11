`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:43 10/31/2018
// Design Name:   DataMemory
// Module Name:   E:/FPGA/CPU/DataMemory_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb;

	// Inputs
	reg [31:0] read_write_addr;
	reg [31:0] write_data;
	reg MemWrite;
	reg clock;

	// Outputs
	wire [31:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.read_write_addr(read_write_addr), 
		.write_data(write_data), 
		.read_data(read_data), 
		.MemWrite(MemWrite), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		read_write_addr = 0;
		write_data = 0;
		MemWrite = 0;
		clock = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		#10;
		MemWrite = 1;
		read_write_addr = 32'd1;
		write_data = 32'd16;
		#10;
		read_write_addr = 32'd3;
		write_data = 32'd27;
		#10;
		MemWrite = 0;
		read_write_addr = 32'd1;
		#10;
		MemWrite = 0;
		read_write_addr = 32'd2;
		#10;
		MemWrite = 0;
		read_write_addr = 32'd3;
		#10;		
		// Add stimulus here

	end
   always #5 clock = ~clock;
endmodule

