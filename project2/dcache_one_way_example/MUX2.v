module MUX2
(
	data1_i,
	data2_i,
	control_i,
	data_o
);

input	[31:0]	data1_i;
input	[25:0]	data2_i;
input			control_i;
output	[31:0]	data_o;

reg 	[31:0]	input2;

assign data_o = (control_i == 0)? (data1_i):
				input2;

always @(*) begin
	input2[31:28] <= data1_i[31:28];
	input2[27:0]  <= data2_i<<2;
end
				
endmodule