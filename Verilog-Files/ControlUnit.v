`timescale 1ns / 1ps

/*Assignment No. 7
  Semester 5
  Group No. 13
  Members : 
  		Arpit Jain (16CS10007)
		Eeshan Gupta (16CS30009)
*/

//Life

module ControlUnit(
	input [31:0] instruction,
	output reg [1:0] ALUSource, 
	output reg [1:0] MemToReg, 
	output reg [1:0] RegDst,
	output reg [2:0] AluControl,
	output reg [3:0] FlagControl,
	output reg BranchControl,
	output reg MemWrite,
	output reg RegWrite
    );
	 
	wire [5:0] opcode;
	assign opcode = instruction[31:26];
	wire [4:0] functcode;
	assign functcode = instruction[4:0];

	always@(*)
	begin
		case(opcode)
				6'd32: 
				begin
					AluControl <= functcode[2:0];
					case(functcode)
						5'd0:
						begin
							BranchControl <= 1'b0;
							FlagControl <= 4'b0;
							MemWrite <= 1'b0;
							RegWrite <= 1'b1;
							ALUSource <= 2'b0;
							MemToReg <= 2'b0;
							RegDst <= 2'b0;
						end
						
						5'd1:
						begin
							BranchControl <= 1'b0;
							FlagControl <= 4'b0;
							MemWrite <= 1'b0;
							RegWrite <= 1'b1;
							ALUSource <= 2'b0;
							MemToReg <= 2'b0;
							RegDst <= 2'b0;
						end
						
						5'd2:
						begin
							BranchControl <= 1'b0;
							FlagControl <= 4'b0;
							MemWrite <= 1'b0;
							RegWrite <= 1'b1;
							ALUSource <= 2'b0;
							MemToReg <= 2'b0;
							RegDst <= 2'b0;
						end
						
						5'd3:
						begin
							BranchControl <= 1'b0;
							FlagControl <= 4'b0;
							MemWrite <= 1'b0;
							RegWrite <= 1'b1;
							ALUSource <= 2'b0;
							MemToReg <= 2'b0;
							RegDst <= 2'b0;
						end
						
						5'd4:
						begin
							BranchControl <= 1'b0;
							FlagControl <= 4'b0;
							MemWrite <= 1'b0;
							RegWrite <= 1'b1;
							ALUSource <= 2'b10;
							MemToReg <= 2'b0;
							RegDst <= 2'b0;
						end
						
						5'd5:
						begin
							BranchControl <= 1'b0;
							FlagControl <= 4'b0;
							MemWrite <= 1'b0;
							RegWrite <= 1'b1;
							ALUSource <= 2'b10;
							MemToReg <= 2'b0;
							RegDst <= 2'b0;
						end
						
						5'd12:
						begin
							BranchControl <= 1'b0;
							FlagControl <= 4'b0;
							MemWrite <= 1'b0;
							RegWrite <= 1'b1;
							ALUSource <= 2'b0;
							MemToReg <= 2'b0;
							RegDst <= 2'b0;
						end
						
						5'd13:
						begin
							BranchControl <= 1'b0;
							FlagControl <= 4'b0;
							MemWrite <= 1'b0;
							RegWrite <= 1'b1;
							ALUSource <= 2'b0;
							MemToReg <= 2'b0;
							RegDst <= 2'b0;
						end
						
						5'd7:
						begin
							BranchControl <= 1'b0;
							FlagControl <= 4'b0;
							MemWrite <= 1'b0;
							RegWrite <= 1'b1;
							ALUSource <= 2'b10;
							MemToReg <= 2'b0;
							RegDst <= 2'b0;
						end
						
						5'd15:
						begin
							BranchControl <= 1'b0;
							FlagControl <= 4'b0;
							MemWrite <= 1'b0;
							RegWrite <= 1'b1;
							ALUSource <= 2'b0;
							MemToReg <= 2'b0;
							RegDst <= 2'b0;
						end
						
						

					endcase
					
				end
				
				6'd0:
				begin 
					AluControl <= 3'b0;
					BranchControl <= 1'b0;
					FlagControl <= 4'b0;
					MemWrite <= 1'b0;
					RegWrite <= 1'b1;
					ALUSource <= 2'b1;
					MemToReg <= 2'b0;
					RegDst <= 2'b0;
				end
				
				6'd1:
				begin 
					AluControl <= 3'b1;
					BranchControl <= 1'b0;
					FlagControl <= 4'b0;
					MemWrite <= 1'b0;
					RegWrite <= 1'b1;
					ALUSource <= 2'b1;
					MemToReg <= 2'b0;
					RegDst <= 2'b0;
				end
				
				6'd2:
				begin 
					AluControl <= 3'b0;
					BranchControl <= 1'b0;
					FlagControl <= 4'b0;
					MemWrite <= 1'b0;
					RegWrite <= 1'b1;
					ALUSource <= 2'b1;
					MemToReg <= 2'b1;
					RegDst <= 2'b1;
				end
				
				6'd3:
				begin 
					AluControl <= 3'b0;
					BranchControl <= 1'b0;
					FlagControl <= 4'b0;
					MemWrite <= 1'b1;
					RegWrite <= 1'b0;
					ALUSource <= 2'b1;
					MemToReg <= 2'b0;
					RegDst <= 2'b0;
				end
				
				6'd4, 6'd5, 6'd6, 6'd7, 6'd8, 6'd9, 6'd10, 6'd11:
				begin 
					AluControl <= 3'b0;
					BranchControl <= 1'b1;
					FlagControl <= opcode[3:0];
					MemWrite <= 1'b0;
					RegWrite <= 1'b0;
					ALUSource <= 2'b1;
					MemToReg <= 2'b0;
					RegDst <= 2'b0;
				end
				
				6'd12:
				begin 
					AluControl <= 3'b0;
					BranchControl <= 1'b1;
					FlagControl <= opcode[3:0];
					MemWrite <= 1'b0;
					RegWrite <= 1'b0;
					ALUSource <= 2'b1;
					MemToReg <= 2'b0;
					RegDst <= 2'b0;
				end
				
				6'd13:
				begin 
					AluControl <= 3'b0;
					BranchControl <= 1'b1;
					FlagControl <= opcode[3:0];
					MemWrite <= 1'b0;
					RegWrite <= 1'b0;
					ALUSource <= 2'b11;
					MemToReg <= 2'b0;
					RegDst <= 2'b0;
				end
				
				6'd14:
				begin 
					AluControl <= 3'b0;
					BranchControl <= 1'b1;
					FlagControl <= opcode[3:0];
					MemWrite <= 1'b0;
					RegWrite <= 1'b1;
					ALUSource <= 2'b1;
					MemToReg <= 2'b10;
					RegDst <= 2'b10;
				end
				
				6'd15:
				begin 
					AluControl <= 3'b0;
					BranchControl <= 1'b1;
					FlagControl <= opcode[3:0];
					MemWrite <= 1'b0;
					RegWrite <= 1'b0;
					ALUSource <= 2'b11;
					MemToReg <= 2'b0;
					RegDst <= 2'b0;
				end
				
				default:
				begin 
					AluControl <= 3'b0;
					BranchControl <= 1'b1;
					FlagControl <= opcode[3:0];
					MemWrite <= 1'b0;
					RegWrite <= 1'b0;
					ALUSource <= 2'b11;
					MemToReg <= 2'b0;
					RegDst <= 2'b0;
				end
		endcase
	end
endmodule
