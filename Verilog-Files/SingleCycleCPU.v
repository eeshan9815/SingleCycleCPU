`timescale 1ns / 1ps

/*Assignment No. 7
  Semester 5
  Group No. 13
  Members : 
  		Arpit Jain (16CS10007)
		Eeshan Gupta (16CS30009)
*/
module SingleCycleCPU(
	input clock,
	input reset,
	output [7:0] display
	);
	 wire [31:0] out;
	 wire [4:0] read_addr_1_RB, read_addr_2_RB, write_addr_RB; 
	 wire [31:0] write_data_RB, read_data_1_RB, read_data_2_RB;//Register Bank
	 wire [31:0] in_counter, out_counter;//Program Counter
	 wire [31:0] read_addr_IM, instruction;//Instruction Memory
	 wire [31:0] read_write_addr_DM, write_data_DM, read_data_DM;//Data Memory
	 wire MemWrite, RegWrite;
	 wire [31:0] in_a, in_b;//ALU
	 reg zflagFF, signflagFF, carryflagFF, overflowflagFF;
	 wire zflag, signflag, carryflag, overflowflag;
	 
	 wire [2:0] AluControl;
	 wire [31:0] jump_addr, pcplus4, in_counter_imd;//Branching Logic
	 wire [3:0] FlagControl;
	 wire BranchControl;
	 wire [31:0] imm, shamt;
	 wire [1:0] ALUSource, MemToReg, RegDst;//Control Unit
	 
	 ProgramCounter program_counter(in_counter, out_counter, clock, reset);
	 InstructionMemory instruction_memory(reset, read_addr_IM, instruction, clock);
	 BranchingLogic branching_logic(jump_addr, zflagFF, signflagFF, carryflagFF, overflowflagFF, FlagControl, BranchControl, out_counter, in_counter_imd, pcplus4);
	 RegisterBank register_bank(read_addr_1_RB, read_addr_2_RB, write_addr_RB, write_data_RB, RegWrite, clock, read_data_1_RB, read_data_2_RB, reset);
	 ALU alu(AluControl, in_a, in_b, out, zflag, signflag, carryflag, overflowflag);
	 DataMemory data_memory(read_write_addr_DM, write_data_DM, read_data_DM, MemWrite, clock);
	 ControlUnit control_unit(instruction, ALUSource, MemToReg, RegDst, AluControl, FlagControl, BranchControl, MemWrite, RegWrite);

	 assign imm = {{16{instruction[15]}}, instruction[15:0]};
	 assign shamt = {{27{instruction[15]}}, instruction[15:11]};
	 assign read_addr_IM = out_counter;
	 assign in_a = read_data_1_RB;
	 assign read_write_addr_DM = out;
	 assign write_data_DM = read_data_2_RB;
	 assign jump_addr = in_b;
	 assign read_addr_1_RB = {instruction[25:21]};
	 assign read_addr_2_RB = {instruction[20:16]};

	 assign in_counter = ((FlagControl[0]&FlagControl[2]&FlagControl[3])==1)?read_data_1_RB:in_counter_imd;

	 Mux_4x1 mux_in_b(read_data_2_RB, imm, shamt, read_data_1_RB, in_b, ALUSource);
	 Mux_4x1 mux_mem_to_reg(out, read_data_DM, pcplus4, 32'd0, write_data_RB, MemToReg);
	 Mux_4x1 #(5) mux_reg_dst(instruction[25:21], instruction[20:16], 5'd31, 5'd0, write_addr_RB, RegDst);
	 
	 always@(posedge clock)
	 begin
			zflagFF <= zflag;
			signflagFF <= signflag;
			carryflagFF <= carryflag;
			overflowflagFF <= overflowflag;
	 end
	 
	 assign display = out[7:0];
endmodule

/*

ControlUnit control_unit(
	input [31:0] instruction
    );
	 

DataMemory data_memory(
		read_write_addr,
		write_data,
		read_data,
		MemWrite,
		clock
	);

InstructionMemory(
		reset,
		read_addr,
		instruction
	);

ProgramCounter program_counter(
		in_counter,
		out_counter,
		clock,
		reset
    );
		 
BranchingLogic branching_logic(
	input [31:0] jump_addr,
	input zero_flag,
	input sign_flag,
	input carry_flag,
	input overflow_flag,
	input FlagControl[1:0],
	input BranchControl,
	input [31:0] program_counter_in,
	output [31:0] program_counter_out
);
	 	
ALU alu(
	input [2:0] AluControl,
	input [31:0] in_a,
	input [31:0] in_b,
	output [31:0] out,
	output zflag,
	output signflag,
	output carryflag,
	output overflowflag
    );

	
RegisterBank register_bank(
	read_addr_1, read_addr_2, write_addr, write_data, RegWrite,	clock, read_data_1, read_data_2
    );*/