module IF_ID 	
(
	clk_i,
	inst_addr_i,
	inst_i,
	hd_i,
	flush_i,
	mux2_o,
	hdrt_o,
	hdrs_o,
	op_o,
	inst_addr1_o,
	inst_addr2_o,
	rs1_o,
	rt1_o,
	rs2_o,
	rt2_o,
	sign16_o,
	rd_o
);

input 			clk_i;
input	[31:0]	inst_addr_i,inst_i;
input			hd_i,flush_i;
output	[25:0]	mux2_o;
output	[4:0]	hdrt_o, hdrs_o;
output	[5:0]	op_o;
output	[31:0]	inst_addr1_o,inst_addr2_o;
output	[4:0]	rs1_o,rt1_o, rs2_o, rt2_o, rd_o;
output	[15:0]	sign16_o;

reg [31:0] inst_addr, inst;

assign mux2_o = inst[25:0];
assign op_o = inst[31:26];
assign inst_addr1_o = inst_addr;
assign inst_addr2_o = inst_addr;
assign rs1_o = inst[25:21];
assign rs2_o = inst[25:21];
assign hdrs_o = inst[25:21];
assign hdrt_o = inst[20:16];
assign rt1_o = inst[20:16];
assign rt2_o = inst[20:16];
assign sign16_o = inst[15:0];
assign rd_o = inst[15:11];


always@(negedge clk_i) begin
    if(hd_i == 1)	
		begin	
		end
	else if (flush_i == 1)
		inst <=	32'b11111100000000000000000000000000;
	else 
		begin
        inst_addr <= inst_addr_i;
		inst <= inst_i;
		end
	
end

endmodule 