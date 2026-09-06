module encode_42(Y4,V4,I4);
  input [3:0] I4;
  output [1:0] Y4;
  output V4;
  assign Y4 = {I4[3] | I4[2] , I4[3] | I4[1]};
  assign V4= I4[3] | I4[2] |I4[1] | I4[0] ;
endmodule
