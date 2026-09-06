module encode_42(Y,V,I);
  input [3:0] I;
  output [1:0] Y;
  output V;
  assign Y = {I[3] | I[2] , I[3] | I[1]};
  assign V= I[3] | I[2] |I[1] | I[0] ;
endmodule
