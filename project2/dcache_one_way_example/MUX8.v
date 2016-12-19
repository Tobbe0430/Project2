module MUX8
(
	data1_i,				//8  bits, control stuff
	data2_i,				//8  bits, all zero
	hd_i,					//1  bit, hazard or no hazard
	wb_o,					//2  bits, control input
	mem_o,					//2  bits, control input
	ex_o					//4  bits, control input
);

input	[7:0]	data1_i;
input	[7:0]	data2_i;
input			hd_i;

output	[1:0]	wb_o;
output	[1:0]	mem_o;
output	[3:0]	ex_o;

reg [1:0]	temp_wb_o;
reg [1:0]	temp_mem_o;
reg [3:0]	temp_ex_o;

assign wb_o = temp_wb_o;
assign mem_o = temp_mem_o;
assign ex_o = temp_ex_o;

always @ (*)
begin
		case (hd_i)			
			1'b0:	begin
					temp_wb_o	= data1_i[7:6];
					temp_mem_o	= data1_i[5:4];
					temp_ex_o	= data1_i[3:0];
					end
					
			1'b1:	begin
					temp_wb_o	= data2_i[7:6];
					temp_mem_o	= data2_i[5:4];
					temp_ex_o	= data2_i[3:0];
					end
			default: $display("Error in MUX8");
		endcase
end

endmodule