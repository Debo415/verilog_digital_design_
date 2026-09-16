module tb_counter_up;

    reg clk;
    reg rst;
    wire [7:0] count;

    reg [7:0] expected;
    integer errors;

    // DUT
    counter_up DUT (
        .count(count),
        .clk(clk),
        .rst(rst)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;
        expected = 8'd0;
        errors = 0;

        $monitor("Time=%0t | rst=%b | clk=%b | count=%0d | expected=%0d",
                 $time, rst, clk, count, expected);

        // -------------------------
        // RESET TEST
        // -------------------------
        @(posedge clk);
        #1;

        if (count !== expected) begin
            $display("FAIL: Reset | count=%d expected=%d",
                     count, expected);
            errors = errors + 1;
        end
        else
            $display("PASS: Reset");

        // -------------------------
        // COUNTING TEST
        // -------------------------
        rst = 0;

        repeat(10) begin

            @(posedge clk);
            #1;

            expected = expected + 1;

            if (count !== expected) begin
                $display("FAIL: count=%d expected=%d",
                         count, expected);
                errors = errors + 1;
            end
            else begin
                $display("PASS: count=%d", count);
            end

        end

        // -------------------------
        // RESET AGAIN
        // -------------------------
        rst = 1;

        @(posedge clk);
        #1;

        expected = 8'd0;

        if (count !== expected) begin
            $display("FAIL: Reset again | count=%d expected=%d",
                     count, expected);
            errors = errors + 1;
        end
        else
            $display("PASS: Reset again");

        // -------------------------
        // FINAL RESULT
        // -------------------------
        if (errors == 0)
            $display("\n========== ALL TESTS PASSED ==========");
        else
            $display("\n========== %0d TESTS FAILED ==========",
                     errors);

        $finish;

    end

endmodule
