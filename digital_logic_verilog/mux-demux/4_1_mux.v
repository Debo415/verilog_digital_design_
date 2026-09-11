module mux_41_df(Y4,I4,S4);
  input [3:0] I4;
  input [1:0]S4;
  output Y4;
  assign Y4 = I4[S4];
endmodule
