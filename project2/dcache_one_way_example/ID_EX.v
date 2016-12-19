module ID_EX
(
	clk_i,
	wb_i,
	mem_i,
	ex_i,
	inst_addr_i,
	rsdata_i,
	rtdata_i,
	imm_i,
	rsaddr_i,
	rtaddr_i,
	rdaddr_i,
	wb_o,
	mem1_o,
	mem2_o,
	ex1_o,
	ex2_o,
	ex3_o,
	rsdata_o,
	rtdata_o,
	imm_o,
	funct_o,
	rsaddr_o,
	rtaddr1_o,
	rtaddr2_o,
	rtaddr3_o,
	rdaddr_o
);

input 			clk_i;
input	[1:0]	wb_i;
input	[1:0]	mem_i;
input	[3:0]	ex_i;
input	[31:0]	inst_addr_i, rsdata_i, rtdata_i, imm_i;
input	[4:0]	rsaddr_i, rtaddr_i, rdaddr_i;
output	[1:0]	wb_o;
output	[1:0]	mem1_o;
output  		mem2_o;
output			ex1_o, ex3_o;
output	[1:0]	ex2_o;
output	[31:0]	rsdata_o, rtdata_o, imm_o;
output	[5:0]	funct_o;
output	[4:0]	rsaddr_o, rtaddr1_o, rtaddr2_o, rtaddr3_o, rdaddr_o;

reg 	[1:0]	wb;
reg 	[1:0]	mem;
reg 	[3:0]	ex;
reg 	[31:0] 	inst_addr, rsdata, rtdata, imm;
reg 	[4:0]	rsaddr, rtaddr, rdaddr;

assign wb_o = wb;
assign mem1_o = mem;
assign mem2_o = mem[0];
assign ex1_o = ex[0];
assign ex2_o = ex[2:1];
assign ex3_o = ex[3];	
assign rsdata_o = rsdata;
assign rtdata_o = rtdata;
assign imm_o = imm;
assign funct_o = imm[5:0];
assign rsaddr_o = rsaddr;
assign rtaddr1_o = rtaddr;
assign rtaddr2_o = rtaddr;
assign rtaddr3_o = rtaddr;
assign rdaddr_o = rdaddr;


always@(negedge clk_i) begin
        wb <= wb_i;
		mem <= mem_i;
		ex <= ex_i;
		inst_addr <= inst_addr_i;
		rsdata <= rsdata_i;
		rtdata <= rtdata_i;
		imm <= imm_i;
		rsaddr <= rsaddr_i;
		rtaddr <= rtaddr_i;
		rdaddr <= rdaddr_i;
end

endmodule