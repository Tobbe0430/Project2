module Registers
(
    clk_i,
    rsaddr_i,
    rtaddr_i,
    writeaddr_i,
    writedata_i,
    regwrite_i,
    rsdata1_o, 
	rsdata2_o,
	rtdata1_o,
    rtdata2_o 
	
);

// Ports
input               regwrite_i, clk_i;
input   [4:0]       rsaddr_i, rtaddr_i, writeaddr_i;
input   [31:0]      writedata_i;
output  [31:0]      rsdata1_o, rsdata2_o; 
output  [31:0]      rtdata1_o, rtdata2_o;

// Register File
reg     [31:0]      register        [0:31];


// Read Data      
assign  rsdata1_o = register[rsaddr_i];
assign  rtdata1_o = register[rtaddr_i];
assign  rsdata2_o = register[rsaddr_i];
assign  rtdata2_o = register[rtaddr_i];

// Write Data   
always@(negedge clk_i) begin
    if(regwrite_i)
        register[writeaddr_i] <= writedata_i;
end
   
endmodule 
