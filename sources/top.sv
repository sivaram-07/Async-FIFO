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


sync_r2w #(DEPTH) sync_r2w(.w_clk(w_clk), .rst_n(rst_n),.wsync_ptr2(wsync_ptr2), .rptr(rptr));

sync_w2r #(DEPTH) sync_w2r(.r_clk(r_clk), .rst_n(rst_n),.rsync_ptr2(rsync_ptr2), .wptr(wptr));

fifo_mem #(WIDTH,DEPTH) fifomem
(.w_clk(w_clk),.rdata(rdata),.wdata(wdata),.waddr(waddr), .raddr(raddr),.full(full),.empty(empty),.wr_rq(wr_rq),.rd_rq(rd_rq));

full #(WIDTH,DEPTH) full_1
(.w_clk(w_clk),.rst_n(rst_n),.full(full), .waddr(waddr),.wptr(wptr), .wsync_ptr2(wsync_ptr2),.wr_rq(wr_rq));

empty  #(WIDTH,DEPTH) empty_1
(.r_clk(r_clk),.rst_n(rst_n),.empty(empty), .raddr(raddr),.rptr(rptr), .rsync_ptr2(rsync_ptr2),.rd_rq(rd_rq));



endmodule
