module empty
#(parameter WIDTH=8,
 parameter DEPTH=16
)
(input logic r_clk,rst_n,rd_rq,
input logic [$clog2(DEPTH):0]rsync_ptr2,
output logic [$clog2(DEPTH)-1:0]raddr,
output logic [$clog2(DEPTH):0]rptr,
output logic empty
);

logic [$clog2(WIDTH):0]bin,binnext,graynext;
logic emptyn;
always_ff @(posedge r_clk or negedge rst_n)
if(~rst_n) begin
rptr<='d0;
bin<='d0;
empty<=1;
end
else begin
rptr<=graynext;
bin<=binnext;
empty<=emptyn;
end

always_comb begin
raddr=bin[$clog2(WIDTH)-1:0];
binnext=bin+(~empty & rd_rq);
graynext=(binnext>>1)^binnext;
emptyn=(graynext==rsync_ptr2);
end


endmodule

