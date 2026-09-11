module all_mux_tb;
  reg [1:0] I2;
  reg S2;
  wire Y2;

  reg [3:0] I4;
  reg S4;
  wire Y4;
  integer i;
  mux_21 MUX21( .S2(S2), .I2(I2), .Y2(Y2));
  mux_41 MUX41( .S4(S4), .I4(I4), .Y4(Y4));

  initial begin
    for(i=0; i<8; i=i+1) begin
      {S2,I2}=i;
      #10;
      $monitor("S=%b I=%b | Y21=%b ", S2,I2,Y2);
    end

    for(i=0; i<64; i=i+1) begin
      {S4,I4}=i;
      #10;
      $monitor("S=%b I=%b | Y41=%b ", S4,I4,Y4);
    end
    
    $finish;
  end
endmodule
