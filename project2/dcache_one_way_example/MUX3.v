module MUX3
(
	regdst_i,
	data1_i,
	data2_i,
	data_o
);

input			regdst_i;
input	[4:0]	data1_i,data2_i;
output	[4:0]	data_o;

assign data_o = (regdst_i == 0)? (data1_i):
				data2_i;
				
endmodule