module fifo_mem 
#(parameter WIDTH=8,
  parameter DEPTH=16)
(
input w_clk,wr_rq,rd_rq,
input full,empty,
input logic [$clog2(DEPTH)-1:0]waddr,raddr,
input logic[WIDTH-1:0]wdata,
output logic[WIDTH-1:0]rdata
);


logic [WIDTH-1:0]fifo[DEPTH-1:0];

//writing into fifo when not full & requested from write clk domain
always_ff @(posedge w_clk)
if(wr_rq & !full)
fifo[waddr]<=wdata;

//reading from fifo when not empty & requested from read clk domain
always_comb begin
if(rd_rq & !empty)
rdata = fifo[raddr];
else
rdata = 'd0;
end

endmodule

