module demux_12(
    input I2,
    input S2,
    output reg [1:0] Y2);
  always @(*) begin
    Y2 = 2'b00;

      case (S2)
          1'b0: Y2[0] = I2;
          1'b1: Y2[1] = I2;
    endcase
end

