module FU
(
	rsaddr_i,
	rtaddr_i,
	writeaddr1_i, //EX_MEM.writeaddr
	writeaddr2_i, //MEM_WB.writeaddr
	wb1_i,
	wb2_i,
	mux6_o,
	mux7_o
);

input	[4:0]	rsaddr_i, rtaddr_i, writeaddr1_i, writeaddr2_i;
input	[1:0]	wb1_i;
input			wb2_i;
output	[1:0]	mux6_o, mux7_o;

reg [1:0] mux6ctrl, mux7ctrl;

assign mux6_o = mux6ctrl;
assign mux7_o = mux7ctrl;



always @ (*)
begin
	if ((writeaddr1_i != 5'b0) & (writeaddr1_i == rsaddr_i) & (wb1_i[0] == 1'b1))
		mux6ctrl = 2'b10;
	
	else if ((writeaddr2_i != 5'b0) & (writeaddr2_i == rsaddr_i) & (wb2_i == 1'b1))
		mux6ctrl = 2'b01;
	else 
		begin
		mux6ctrl = 2'b00;
		end

	if ((writeaddr1_i != 5'b0) & (writeaddr1_i == rtaddr_i) & (wb1_i[0	] == 1'b1))
		mux7ctrl = 2'b10;
	else if ((writeaddr2_i != 5'b0) & (writeaddr2_i == rtaddr_i) & (wb2_i == 1'b1))
		mux7ctrl = 2'b01;
	else
		begin
		mux7ctrl = 2'b00;
		end
end

endmodule