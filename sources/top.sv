module top
#(parameter WIDTH=8,
 parameter DEPTH=16
)
(input w_clk,r_clk,rst_n,wr_rq,rd_rq,
input logic [WIDTH-1:0]wdata,
output logic full,empty,
output logic [WIDTH-1:0]rdata
);

wire [$clog2(DEPTH)-1:0] waddr,raddr;
wire [$clog2(DEPTH):0] wptr,rptr,wsync_ptr2,rsync_ptr2;


sync_r2w #(DEPTH) sync_r2w(.*);

sync_w2r #(DEPTH) sync_w2r(.*);

fifo_mem #(WIDTH,DEPTH) fifomem(.*);

full #(WIDTH,DEPTH) full_1(.*);

empty  #(WIDTH,DEPTH) empty_1(.*);



endmodule
