module full
#(parameter WIDTH=8,
  parameter DEPTH=16
)
(input logic w_clk,rst_n,wr_rq,
input logic [$clog2(DEPTH):0]wsync_ptr2,
output logic [$clog2(DEPTH)-1:0]waddr,
output logic [$clog2(DEPTH):0]wptr,
output logic full
);

logic [$clog2(WIDTH):0]bin,binnext,graynext;
logic fulln;
always_ff @(posedge w_clk or negedge rst_n)
if(~rst_n) begin
wptr<='d0;
bin<='d0;
full<=0;
end
else begin
wptr<=graynext;
bin<=binnext;
full<=fulln;
end

always_comb begin
waddr=bin[$clog2(WIDTH)-1:0];
binnext=bin+(~full & wr_rq);
graynext=(binnext>>1)^binnext;
fulln=(graynext=={~wsync_ptr2[$clog2(WIDTH):$clog2(WIDTH)-1],wsync_ptr2[$clog2(WIDTH)-2:0]});
end




















endmodule

