module Sign_Extend
(
	if_id_i,
	id_ex_o,
	b_add_o
);

input 	[15:0] 	if_id_i;
output 	[31:0] 	id_ex_o;
output	[31:0]	b_add_o;

assign id_ex_o[31:16] = (if_id_i[15] == 1'b1)? (16'b1111111111111111):
					   16'b0000000000000000;
assign id_ex_o[15:0]  = if_id_i;

assign b_add_o = id_ex_o;


endmodule