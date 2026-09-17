module subtractor_8bit (
    input  [7:0] A,
    input  [7:0] B,
    output [7:0] Diff,
    output       Borrow
);

    wire [8:0] result;

    // A - B = A + (~B) + 1
    assign result = {1'b0, A} + {1'b0, ~B} + 9'b000000001;

    assign Diff   = result[7:0];
    assign Borrow = ~result[8];

endmodule

