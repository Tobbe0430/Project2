module EX_MEM
(
	clk_i,
	wb_i,
	mem_i,
	result_i,
	rtdata_i,
	writeaddr_i,
	wb1_o,
	wb2_o,
	mem1_o,
	mem2_o,
	result1_o,
	result2_o,
	result3_o,
	result4_o,
	rtdata_o,
	writeaddr1_o,
	writeaddr2_o
);

input			clk_i;
input	[1:0]	wb_i;
input	[1:0]	mem_i;
input	[31:0]	result_i, rtdata_i;
input	[4:0]	writeaddr_i;
output	[1:0]	wb1_o, wb2_o;
output			mem1_o, mem2_o;
output	[31:0]	result1_o, result2_o, result3_o, result4_o, rtdata_o;
output	[4:0]	writeaddr1_o, writeaddr2_o;

reg 	[1:0]	wb;
reg		[1:0]	mem;
reg 	[31:0]	result, rtdata;
reg		[4:0]	writeaddr;

assign wb1_o = wb;
assign wb2_o = wb;
assign mem1_o = mem[0];
assign mem2_o = mem[1];
assign result1_o = result;
assign result2_o = result;
assign result3_o = result;
assign result4_o = result;
assign rtdata_o = rtdata;
assign writeaddr1_o = writeaddr;
assign writeaddr2_o = writeaddr;

always@(negedge clk_i) begin
	wb <= wb_i;
	mem <= mem_i;
	result <= result_i;
	rtdata <= rtdata_i;
	writeaddr <= writeaddr_i;
end

endmodule