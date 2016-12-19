module MUX1
(
	and1_i,
	and2_i,
	data1_i,
	data2_i,
	data_o,
	andresult_o
);

input			and1_i, and2_i;
input	[31:0]	data1_i,data2_i;
output	[31:0]	data_o;
output			andresult_o;

assign andresult_o = and1_i & and2_i;
assign data_o = (andresult_o == 1)? (data1_i):
				data2_i;

endmodule