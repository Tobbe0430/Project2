module Flush
(
	jump_i,
	branch_i,
	flush_o
);

input	jump_i, branch_i;
output	flush_o;

reg flush;

assign flush_o = flush;



always @ (*)
begin
	if ((jump_i == 1'b0) & (branch_i == 1'b0))
		flush = 1'b0;
	else
		flush = 1'b1;
end

endmodule