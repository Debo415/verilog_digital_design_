module tb;

reg clk;
reg rst;
reg [3:0] d;
wire [3:0] q;

register_4bit uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    d = 4'b0000;

    #10 rst = 0;

    #10 d = 4'b1010;
    #10 d = 4'b1100;
    #10 d = 4'b0011;
    #10 d = 4'b1111;

    #20 $finish;
end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
end

endmodule
