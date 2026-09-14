module cla_adder_4bit(
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output [3:0] sum,
    output       cout
);

    wire [3:0] p;
    wire [3:0] g;
    wire [4:0] c;

    // Propagate and Generate
    assign p = a ^ b;
    assign g = a & b;

    assign c[0] = cin;

    // Carry Look-Ahead equations
    assign c[1] = g[0] |
                  (p[0] & c[0]);

    assign c[2] = g[1] |
                  (p[1] & g[0]) |
                  (p[1] & p[0] & c[0]);

    assign c[3] = g[2] |
                  (p[2] & g[1]) |
                  (p[2] & p[1] & g[0]) |
                  (p[2] & p[1] & p[0] & c[0]);

    assign c[4] = g[3] |
                  (p[3] & g[2]) |
                  (p[3] & p[2] & g[1]) |
                  (p[3] & p[2] & p[1] & g[0]) |
                  (p[3] & p[2] & p[1] & p[0] & c[0]);

    // Sum
    assign sum = p ^ c[3:0];

    // Final carry
    assign cout = c[4];

endmodule
