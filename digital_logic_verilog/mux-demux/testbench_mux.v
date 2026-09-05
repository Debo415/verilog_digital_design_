module all_mux_tb;
  reg [1:0] I1, [3:0] I2, S;
  wire Y2;
  wire Y4;
  mux_21 MUX21( .S(S), .I(I), .Y(Y2));
  mux_41 MUX41( .S(S), .I(I), .Y(Y4));

  initial begin
    $monitor("S=%b I=%b | Y21=%b Y41=%b ", S,I,Y2,Y4);
    reg [3:0] A;
        integer i;
        initial begin
            for(i=0; i<16; i=i+1) begin
                A=i;
                #10;
            end
        end
        $finish;
    end
    
