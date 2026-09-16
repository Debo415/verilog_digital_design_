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

    @(posedge clk);
    #1; 
    if (q === 4'b0000) 
        $display("PASS: Reset test | q = %b", q); 
    else 
        $display("FAIL: Reset test | q = %b, expected = 0000", q);
    rst = 0; 
    d = 4'b1010; 
    @(posedge clk);
    #1; 
    if (q === d) 
        $display("PASS: Load 1010 | d = %b | q = %b", d, q); 
    else 
        $display("FAIL: Load 1010 | d = %b | q = %b", d, q);
    d = 4'b1111;
    @(posedge clk);
    #1;
    if (q === d) 
        $display("PASS: Load 1111 | d = %b | q = %b", d, q); 
    else 
        $display("FAIL: Load 1111 | d = %b | q = %b", d, q);
    d = 4'b0000;
    @(posedge clk); 
    #1; 
    if (q === d) 
        $display("PASS: Hold test");
    else 
        $display("FAIL: Hold test");
    rst = 1;
    @(posedge clk);
    #1; 
    if (q === 4'b0000) 
        $display("PASS: Reset again | q = %b", q);
    else
        $display("FAIL: Reset again | q = %b, expected = 0000", q);
    

    #5 
    $finish;
end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
end

endmodule
