module D_FlipFlop_testbench;
  reg clk, D;
  wire Q;
  D_FlipFlop uut(.clk(clk), .D(D), .Q(Q));
  always #10 clk = ~clk;
  initial begin
    clk = 1;
    $monitor("D = %b, Q = %b", D, Q);
    D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;
    #10;
    $stop;
  end
endmodule
