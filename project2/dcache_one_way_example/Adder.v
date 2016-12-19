module Adder
(
	data1_i,
	data2_i,
	data1_o,
	data2_o
);

input	 [31:0] 	data1_i, data2_i;
output 	 [31:0] 	data1_o, data2_o;

assign data1_o = data1_i + data2_i;
assign data2_o = data1_i + data2_i;

endmodule