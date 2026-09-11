module mux_21(Y2,I2,S2);
  input [1:0] I2;
  input S2;
  output Y2;
  assign Y2 = S2? I2[1] : I2[0];
endmodule
