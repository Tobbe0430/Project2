module Control
(
	op_i,
	mux1_o,
	mux2_o,
	flush_o,
	mux8_o
);

input 	[5:0] 	op_i;
output			mux1_o;
output			mux2_o;
output 			flush_o;
output	[7:0]	mux8_o;

reg 		temp_mux1_o;
reg 		temp_mux2_o;
reg [7:0]	temp_mux8_o;

assign mux1_o = temp_mux1_o;
assign mux2_o = temp_mux2_o; 
assign flush_o = temp_mux2_o;
assign mux8_o = temp_mux8_o;


always @ (op_i)
begin
	case (op_i) 
		//Flush - Changes the memwrite and regwrite to 0 to not change anything.
		6'b111111:	begin
					temp_mux1_o		 = 1'b0;	//We are not going to branch
					temp_mux2_o		 = 1'b0;	//We are not going to jump
					//EX:
					temp_mux8_o[0]   = 1'b0;	//ALUSrc (If we are going to use Immidiate or register in the ALU) 
					temp_mux8_o[2:1] = 2'b11;	//ALUOp (What kind of operation the ALU should do)
					temp_mux8_o[3]   = 1'b1;	//RegDst (If we are going to store our result in rt or rd)
					//M:
					temp_mux8_o[4]   = 1'b0;	//Memread (If we are going to read from memory or not)
					temp_mux8_o[5]   = 1'b0;	//Memwrite (If are going to write into memory or not)
					//WB:
					temp_mux8_o[6]   = 1'b0;	//Regwrite (If we are going to write into the register or not)
					temp_mux8_o[7]   = 1'b0;	//Memreg (If we should save the value from Alu or the memory in the register)			
					end			

		//R-Type
		6'b000000:	begin
					temp_mux1_o		 = 1'b0;	//We are not going to branch
					temp_mux2_o		 = 1'b0;	//We are not going to jump
					//EX:
					temp_mux8_o[0]   = 1'b0;	//ALUSrc (If we are going to use Immidiate or register in the ALU) 
					temp_mux8_o[2:1] = 2'b11;	//ALUOp (What kind of operation the ALU should do)
					temp_mux8_o[3]   = 1'b1;	//RegDst (If we are going to store our result in rt or rd)
					//M:
					temp_mux8_o[4]   = 1'b0;	//Memread (If we are going to read from memory or not)
					temp_mux8_o[5]   = 1'b0;	//Memwrite (If are going to write into memory or not)
					//WB:
					temp_mux8_o[6]   = 1'b1;	//Regwrite (If we are going to write into the register or not)
					temp_mux8_o[7]   = 1'b1;	//Memreg (If we should save the value from Alu or the memory in the register)			
					end			
		//Addi
		6'b001000:	begin
					temp_mux1_o		 = 1'b0;	//We are not going to branch
					temp_mux2_o		 = 1'b0;	//We are not going to jump
					//EX:
					temp_mux8_o[0]   = 1'b1;	//ALUSrc 	(If we are going to use Immidiate or register in the ALU) 
					temp_mux8_o[2:1] = 2'b00;	//ALUOp 	(What kind of operation the ALU should do)
					temp_mux8_o[3]   = 1'b0;	//RegDst 	(If we are going to store our result in rt or rd)
					//M:
					temp_mux8_o[4]   = 1'b0;	//Memread 	(If we are going to read from memory or not)
					temp_mux8_o[5]   = 1'b0;	//Memwrite 	(If are going to write into memory or not)
					//WB:
					temp_mux8_o[6]   = 1'b1;	//Regwrite 	(If we are going to write into the register or not)
					temp_mux8_o[7]   = 1'b1;	//Memreg	(If we should save the value from Alu or the memory in the register)			
					end			
		//Lw
		6'b100011:	begin
					temp_mux1_o		 = 1'b0;	//We are not going to branch
					temp_mux2_o		 = 1'b0;	//We are not going to jump
					//EX:
					temp_mux8_o[0]   = 1'b1;	//ALUSrc 	(If we are going to use Immidiate or register in the ALU) 
					temp_mux8_o[2:1] = 2'b00;	//ALUOp 	(What kind of operation the ALU should do)
					temp_mux8_o[3]   = 1'b0;	//RegDst	(If we are going to store our result in rt or rd)
					//M:
					temp_mux8_o[4]   = 1'b1;	//Memread	(If we are going to read from memory or not)
					temp_mux8_o[5]   = 1'b0;	//Memwrite	(If are going to write into memory or not)
					//WB:
					temp_mux8_o[6]   = 1'b1;	//Regwrite	(If we are going to write into the register or not)
					temp_mux8_o[7]   = 1'b0;	//Memreg	(If we should save the value from Alu or the memory in the register)			
					end
		//Sw
		6'b101011:	begin
					temp_mux1_o		 = 1'b0;	//We are not going to branch
					temp_mux2_o		 = 1'b0;	//We are not going to jump
					//EX:
					temp_mux8_o[0]   = 1'b1;	//ALUSrc 	(If we are going to use Immidiate or register in the ALU) 
					temp_mux8_o[2:1] = 2'b00;	//ALUOp 	(What kind of operation the ALU should do)
					//temp_mux8_o[3]   = 1'b0;	//RegDst	Don't care (If we are going to store our result in rt or rd)
					//M:
					temp_mux8_o[4]   = 1'b0;	//Memread	(If we are going to read from memory or not)
					temp_mux8_o[5]   = 1'b1;	//Memwrite	(If are going to write into memory or not)
					//WB:
					temp_mux8_o[6]   = 1'b0;	//Regwrite	(If we are going to write into the register or not)
					//temp_mux8_o[7]   = 1'b1;	//Memreg	Don't care(If we should save the value from Alu or the memory in the register)			
					end
		//Branch
		6'b000100:	begin
					temp_mux1_o		 = 1'b1; 	//If we are going to branch, send 1 to mux1
					temp_mux2_o		 = 1'b0;	//We are not going to jump
					//EX:
					temp_mux8_o[0]   = 1'b0;	//ALUSrc 	(If we are going to use Immidiate or register in the ALU) 
					//temp_mux8_o[2:1] = 2'b01;	//ALUOp 	(What kind of operation the ALU should do)
					//temp_mux8_o[3]   = 1'b0;	//RegDst	Don't care (If we are going to store our result in rt or rd)
					//M:
					temp_mux8_o[4]   = 1'b0;	//Memread	(If we are going to read from memory or not)
					temp_mux8_o[5]   = 1'b0;	//Memwrite	(If are going to write into memory or not)
					//WB:
					temp_mux8_o[6]   = 1'b0;	//Regwrite	(If we are going to write into the register or not)
					//temp_mux8_o[7]   = 1'b1;	//Memreg	Don't care (If we should save the value from Alu or the memory in the register)			
					end
		//Jump
		6'b000010:	begin
					temp_mux1_o		 = 1'b0; 	//We are not going to branch
					temp_mux2_o		 = 1'b1;	//If we are going to jump, send 1 to mux2
					//EX:
					//temp_mux8_o[0]   = 1'b0;	//ALUSrc 	Don't care (If we are going to use Immidiate or register in the ALU) 
					//temp_mux8_o[2:1] = 2'b01;	//ALUOp 	(What kind of operation the ALU should do)
					//temp_mux8_o[3]   = 1'b0;	//RegDst	Dont' care Don't care (If we are going to store our result in rt or rd)
					//M:
					temp_mux8_o[4]   = 1'b0;	//Memread	(If we are going to read from memory or not)
					temp_mux8_o[5]   = 1'b0;	//Memwrite	(If are going to write into memory or not)
					//WB:
					temp_mux8_o[6]   = 1'b0;	//Regwrite	(If we are going to write into the register or not)
					//temp_mux8_o[7]   = 1'b1;	//Memreg	Don't care (If we should save the value from Alu or the memory in the register)		
					end
		default: 	$display("Error in the control");
				
	endcase
				
		
		//EX:
		//mux8_0[0]   = ALUSrc (If we are going to use Immidiate or register in the ALU) 
		//mux8_0[1:2] = ALUOp (What kind of operation the ALU should do)
		//mux8_0[3]   = RegDst (If we are going to store our result in rt or rd)
		//M:
		//mux8_0[4]   = Memread (If we are going to read from memory or not)
		//mux8_0[5]   = Memwrite (If are going to write into memory or not)
		//WB:
		//mux8_0[6]   = Regwrite (If we are going to write into the register or not)
		//mux8_0[7]   = Memreg (1 = value from Alu or 0 = memory in the register)
		
		
end

endmodule