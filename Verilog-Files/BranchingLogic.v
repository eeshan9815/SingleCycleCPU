`timescale 1ns / 1ps

/*Assignment No. 7
  Semester 5
  Group No. 13
  Members : 
		Eeshan Gupta (16CS30009)
  		Arpit Jain (16CS10007)
*/
module BranchingLogic(
		input [31:0] jump_addr,
		input zero_flag,
		input sign_flag,
		input carry_flag,
		input overflow_flag,
		input [3:0] FlagControl,
		input BranchControl,
		input [31:0] program_counter_in,
		output [31:0] program_counter_out,
		output wire[31:0] pc_plus4
	);
	wire [31:0] jump_counter; 
	wire flag, flag_imd, jump_condition;
	wire dummy1, dummy2, dummy3, dummy4;
	Mux_4x1 #(1)MuxFlagSelector(sign_flag, overflow_flag, zero_flag, carry_flag, flag_imd, FlagControl[2:1]);
	Mux #(1)MuxSignSelector(flag_imd, ~flag_imd, flag, FlagControl[0]);
	assign jump_condition = (flag|(FlagControl[3]&FlagControl[2]))&BranchControl;
	adder A1 (program_counter_in,32'b100,1'b0,pc_plus4,dummy1,dummy2);
	adder A2 (pc_plus4, {jump_addr[29:0],2'b0},1'b0, jump_counter,dummy3,dummy4);
	Mux MuxDestinationSelector(pc_plus4, jump_counter, program_counter_out,jump_condition);
	
endmodule
