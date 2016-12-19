module MUX5
(
	data1_i,
	data2_i,
	memtoreg_i,
	data1_o,
	data2_o,
	data3_o
);

input [31:0] data1_i, data2_i;
input 	    memtoreg_i;
output [31:0] data1_o, data2_o, data3_o;

assign data1_o = (memtoreg_i == 0)? (data1_i):
				data2_i;
assign data2_o = (memtoreg_i == 0)? (data1_i):
				data2_i;
assign data3_o = (memtoreg_i == 0)? (data1_i):
				data2_i;


endmodule