module counter_tb;
  reg clk, rst;
  wire count;
  counter_basic uut(.clk(clk), .rst(rst), .count(count));
  always #5 clk = ~clk;
  initial begin
    clk=0;
    rst=1;
    #10 rst=0;
    #10 rst=1;
    #20 $finish;
  end
endmodule
