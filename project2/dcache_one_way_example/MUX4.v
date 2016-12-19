module MUX4
(
	data1_i,
	data2_i,
	alusrc_i,
	data_o
);

input	[31:0]	data1_i, data2_i;
input			alusrc_i;
output	[31:0]	data_o;

assign data_o = (alusrc_i == 0)? (data1_i):
				data2_i;

endmodule