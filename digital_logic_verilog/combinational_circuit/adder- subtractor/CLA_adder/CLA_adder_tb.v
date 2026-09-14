module tb_cla_adder_4bit;

    reg  [3:0] a, b;
    reg  cin;

    wire [3:0] sum;
    wire cout;

    reg [4:0] expected;

    integer i;
    integer errors = 0;

    // DUT
    cla_adder_4bit DUT (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
      .cout(cout) );

    initial begin

        for (i = 0; i < 20; i = i + 1) begin

            a   = $urandom_range(0, 15);
            b   = $urandom_range(0, 15);
            cin = $urandom_range(0, 1);

            #10;
            expected = a + b + cin;

            if ({cout, sum} != expected) begin
                $display("ERROR");
                errors = errors + 1;
            end
            else begin
              $display("a=%b b=%b cin=%b | sum=%b cout=%b", a, b, cin, sum, cout);
            end

        end
        $display("Testing completed");
        $display("Errors = %0d", errors);
        $finish;
    end

endmodule
