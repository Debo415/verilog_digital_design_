module tb;

reg clk;
reg rst;
reg serial_in;
wire [3:0] q;

integer errors = 0;

shift_register_4bit uut (
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .q(q)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    serial_in = 0;

    @(posedge clk);
    #1;

    if (q !== 4'b0000) begin
        $display("FAIL: RESET | q=%b | expected=0000", q);
        errors = errors + 1;
    end
    else
        $display("PASS: RESET | q=%b", q);

    rst = 0;

    serial_in = 1;

    @(posedge clk);
    #1;

    if (q !== 4'b1000) begin
        $display("FAIL: SHIFT 1 | q=%b | expected=1000", q);
        errors = errors + 1;
    end
    else
        $display("PASS: SHIFT 1 | q=%b", q);

    serial_in = 0;

    @(posedge clk);
    #1;

    if (q !== 4'b0100) begin
        $display("FAIL: SHIFT 0 | q=%b | expected=0100", q);
        errors = errors + 1;
    end
    else
        $display("PASS: SHIFT 0 | q=%b", q);

    serial_in = 1;

    @(posedge clk);
    #1;

    if (q !== 4'b1010) begin
        $display("FAIL: SHIFT 1 | q=%b | expected=1010", q);
        errors = errors + 1;
    end
    else
        $display("PASS: SHIFT 1 | q=%b", q);

    serial_in = 1;

    @(posedge clk);
    #1;

    if (q !== 4'b1101) begin
        $display("FAIL: SHIFT 1 | q=%b | expected=1101", q);
        errors = errors + 1;
    end
    else
        $display("PASS: SHIFT 1 | q=%b", q);
  
    serial_in = 0;

    @(posedge clk);
    #1;

    if (q !== 4'b0110) begin
        $display("FAIL: SHIFT 0 | q=%b | expected=0110", q);
        errors = errors + 1;
    end
    else
        $display("PASS: SHIFT 0 | q=%b", q);


    if (errors == 0)
        $display("ALL TESTS PASSED!");
    else
        $display("%0d TEST(S) FAILED!", errors);

    $finish;
end

endmodule
