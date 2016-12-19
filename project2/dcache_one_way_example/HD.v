module HD
(
	if_idrs_i,
	if_idrt_i,
	id_ex_i,
	id_ex_memread_i, 
	mux8_o,		 
	pc_o,		
	if_id_o 	
);

input [4:0] if_idrt_i, if_idrs_i, id_ex_i; 
input		id_ex_memread_i;
output 		mux8_o;
output 		pc_o;
output		if_id_o;

reg		temp_mux8_o, temp_pc_o, temp_if_id_o;

assign	pc_o = temp_pc_o;
assign	mux8_o = temp_mux8_o;
assign	if_id_o = temp_if_id_o;

always @ (if_idrs_i,if_idrt_i,id_ex_i,id_ex_memread_i)
begin
	if((id_ex_memread_i)&((if_idrs_i==id_ex_i)|(if_idrt_i==id_ex_i)))
		//stall
		begin
		temp_if_id_o =	1'b1;
		temp_pc_o =		1'b1;
		temp_mux8_o =	1'b1;	
		end
	else
		//write
		begin
		temp_if_id_o =	1'b0;
		temp_pc_o =		1'b0;
		temp_mux8_o =	1'b0; 
		end
end
		
endmodule