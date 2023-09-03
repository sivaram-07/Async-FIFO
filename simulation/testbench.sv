module testbench;

parameter WIDTH=8,DEPTH=16;


logic w_clk,r_clk,rst_n,wr_rq,rd_rq,full,empty;
logic [7:0]wdata,rdata;


top u1(.*);


initial
begin
w_clk=0;r_clk=0;wr_rq=0;rd_rq=0;
rst_n=1;
#3 rst_n=0;
#10 rst_n=1;
#10 wr_rq=1;
wdata='d23;

end



always #5 w_clk = ~w_clk;
always #12 r_clk = ~r_clk;

always #100 $finish;

initial begin
$dumpfile("fifo.vcd");
$dumpvars;

end

endmodule
