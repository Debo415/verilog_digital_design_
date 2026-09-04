module mux_41_df(Y,I,S);
  input [3:0] I;
  input [1:0]S;
  output Y;
  assign Y = S[I];
endmodule
