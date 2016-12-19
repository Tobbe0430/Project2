module MUX7
(
	data1_i,
	data2_i,
	data3_i,
	fu_i,
	data1_o,
	data2_o
);

input	[31:0]	data1_i, data2_i, data3_i;
input	[1:0]	fu_i;
output	[31:0]	data1_o, data2_o;

reg		[31:0]	temp_data_o;

assign	data1_o = temp_data_o;
assign	data2_o = temp_data_o;

always @ (*)
begin
		case(fu_i)
			2'b00:	begin
					temp_data_o = data1_i;
					end
			2'b01:	begin
					temp_data_o = data2_i;
					end
			2'b10:	begin
					temp_data_o = data3_i;
					end
			default: $display("Error in MUX 7");
		endcase
end

endmodule