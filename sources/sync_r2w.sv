module sync_r2w
#(parameter DEPTH=16
)
(input logic w_clk,rst_n,
input logic[$clog2(DEPTH):0] rptr,
output logic[$clog2(DEPTH):0] wsync_ptr2);

logic [$clog2(DEPTH):0] wsync_ptr1;

always_ff @(posedge w_clk or negedge rst_n)
if(~rst_n) //at reset both flops of synchronizer is set to 0
begin
wsync_ptr2<='d0;
wsync_ptr1<='d0;
end
else begin // else rptr is fed into shifted sequentially into the write clk domain synchronizer flops
wsync_ptr1<=rptr;
wsync_ptr2<=wsync_ptr1;
end

endmodule

