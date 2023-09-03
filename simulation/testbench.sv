module testbench;

parameter WIDTH=8,DEPTH=16;


logic w_clk,r_clk,rst_n,wr_rq,rd_rq,full,empty;
logic [7:0]wdata,rdata;
logic [7:0]data;

top #(WIDTH,DEPTH)u1(.*);


initial
begin
w_clk=0;r_clk=0;wr_rq=0;rd_rq=0;
rst_n=1;
#3 rst_n=0;
#10 rst_n=1;data=0;

#13 wr_rq=1;rd_rq=1;


fork
repeat(40) begin
if(!full)begin
wdata=data;
data=data+1;
end
#10;

end
join



end

always #5 w_clk = ~w_clk;
always #10 r_clk = ~r_clk;

always #1500 $finish;

initial begin
$dumpfile("fifo.vcd");
$dumpvars;

end

endmodule
