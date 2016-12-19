module MUX6
(
	data1_i,
	data2_i,		
	data3_i,
	fu_i,
	data_o
);

input	[31:0]	data1_i, data2_i, data3_i;
input	[1:0]	fu_i;
output	[31:0]	data_o;

reg		[31:0]	temp_data_o;
assign	data_o = temp_data_o;

always @ (*)
begin
		case(fu_i)
			2'b00:	temp_data_o = data1_i;
			2'b01:	temp_data_o = data2_i;
			2'b10:	temp_data_o = data3_i;
			default: $display("Error in MUX6");
		endcase
end

endmodule