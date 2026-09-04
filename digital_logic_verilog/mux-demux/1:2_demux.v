module demux_1to2(
    input D,
    input S,
  output reg [1:0] Y);
  always @(*) begin
    Y = 2'b00;

    case (S)
        1'b0: Y[0] = D;
        1'b1: Y[1] = D;
    endcase
end

