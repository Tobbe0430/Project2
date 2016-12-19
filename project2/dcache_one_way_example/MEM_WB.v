module MEM_WB
(
	clk_i,
	wb_i,
	memdata_i,
	aluresult_i,
	writeaddr_i,
	wb1_o,
	wb2_o,
	wb3_o,
	memdata_o,
	aluresult_o,
	writeaddr1_o,
	writeaddr2_o
);

input 			clk_i;
input	[1:0]	wb_i;
input	[31:0]	memdata_i,aluresult_i;
input 	[4:0] 	writeaddr_i;
output			wb1_o, wb2_o, wb3_o;
output	[31:0]	memdata_o, aluresult_o;
output	[4:0]	writeaddr1_o, writeaddr2_o;

reg 	[1:0] 	wb;
reg 	[31:0] 	memdata, aluresult;
reg		[4:0] 	writeaddr;

assign wb1_o = wb[0];
assign wb2_o = wb[0];
assign wb3_o = wb[1];
assign memdata_o = memdata;
assign aluresult_o = aluresult;
assign writeaddr1_o = writeaddr;
assign writeaddr2_o = writeaddr;


always@(negedge clk_i) begin
        wb <= wb_i;
		memdata <= memdata_i;
		aluresult <= aluresult_i;
		writeaddr <= writeaddr_i; 
end

endmodule 