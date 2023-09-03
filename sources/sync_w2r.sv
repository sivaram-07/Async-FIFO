module sync_w2r
#(parameter DEPTH=16
)
(input logic r_clk,rst_n,
input logic[$clog2(DEPTH):0] wptr,
output logic[$clog2(DEPTH):0] rsync_ptr2);

logic [$clog2(DEPTH):0] rsync_ptr1;

always @(posedge r_clk or negedge rst_n)
if(~rst_n) //at reset both flops of synchronizer is set to 0
begin
rsync_ptr2<='d0;
rsync_ptr1<='d0;
end
else begin // else wptr is fed into shifted sequentially into the read clk domain synchronizer flops
rsync_ptr1<=wptr;
rsync_ptr2<=rsync_ptr1;
end

endmodule




