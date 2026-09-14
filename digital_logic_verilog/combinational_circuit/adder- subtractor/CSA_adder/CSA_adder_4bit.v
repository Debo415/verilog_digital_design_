module csa_4bit(
    input  [3:0] a,
    input  [3:0] b,
    input  [3:0] c,
    output [4:0] result
);

    wire [3:0] sum;
    wire [3:0] carry;

    // Four Full Adders operating in parallel
    full_adder FA0(a[0], b[0], c[0], sum[0], carry[0]);
    full_adder FA1(a[1], b[1], c[1], sum[1], carry[1]);
    full_adder FA2(a[2], b[2], c[2], sum[2], carry[2]);
    full_adder FA3(a[3], b[3], c[3], sum[3], carry[3]);

    // Final addition:
    // sum + (carry shifted left by 1)
    assign result = sum + (carry << 1);

endmodule
