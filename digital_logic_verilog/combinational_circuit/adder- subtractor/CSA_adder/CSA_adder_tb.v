module tb_csa_4bit;

    reg [3:0] a, b, c;

  wire [5:0] result;

    reg [5:0] expected;

    integer i;
    integer errors = 0;

    // DUT
    csa_4bit DUT (
        .a(a),
        .b(b),
        .c(c),
        .result(result)
    );

    initial begin

        for (i = 0; i < 20; i = i + 1) begin

            a = $urandom_range(0, 15);
            b = $urandom_range(0, 15);
            c = $urandom_range(0, 15);

            #10;

            expected = a + b + c;

            if (result != expected) begin
                $display("ERROR" );
                errors = errors + 1;
            end
            else begin
                $display(" a=%b b=%b c=%b | result=%b",
                         a, b, c, result);
            end

        end

        $display("Testing completed");
        $display("Errors = %0d", errors);
        $finish;
    end

endmodule
