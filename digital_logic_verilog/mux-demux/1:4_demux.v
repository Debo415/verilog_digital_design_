module demux_14(
    input I4,
    input [1:0] S4,
    output reg [3:0] Y4
);

always @(*) begin

    // Default: all outputs OFF
    Y4 = 2'b00;

    case(S4)
        2'b00: Y4[0] = I4;
        2'b01: Y4[1] = I4;
        2'b10: Y4[2] = I4;
        2'b11: Y4[3] = I4;
    endcase
end
endmodule
