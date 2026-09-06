module encoder_42_testbench;
  reg [3:0] I;
  wire [1:0] Y;
  encoder_42_behavioral uut(.Y(Y),.D(D));
  initial begin
    $monitor ("I = %b, Y = %b", I, Y);
    I = 4'b0001;
    #100 I = 4'b0010;
    #100 I = 4'b0100;
    #100 I = 4'b1000;
    #100;
    $finish;
  end
endmodule
