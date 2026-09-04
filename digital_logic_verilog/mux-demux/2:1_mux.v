module mux_21_df(Y,I,S);
  input [1:0] I;
  input S;
  output [3:0] Y;
  assign Y = S? I[1] : I[0];
endmodule
