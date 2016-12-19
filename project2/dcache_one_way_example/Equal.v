module Equal
(
	rsdata_i,			//32 bits, rs data
	rtdata_i,			//32 bits, rt data
	zero_o				//1  bit, is it zero or not
);

input	[31:0]	rsdata_i;
input	[31:0]	rtdata_i;
output 			zero_o;

assign zero_o = (rsdata_i == rtdata_i)? (1'b1):
				0;
				
endmodule 