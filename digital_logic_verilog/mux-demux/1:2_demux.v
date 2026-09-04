module 12_demux_df(Y,I,S);
  input I,S;
  output [1:0] Y;
  assign Y[0]= I & ~S;
  assign Y[0]= I & S;
endmodule
