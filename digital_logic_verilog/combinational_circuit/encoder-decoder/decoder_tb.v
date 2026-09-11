module decoder_24_tb;
  reg a, b, en;
  wire y0, y1, y2, y3;
  decoder_24 dut(.a(a), .b(b), .en(en),.y0(y0), .y1(y1), .y2(y2), .y3(y3));
  initial begin
    $monitor ("a = %b, b = %b | y0 = %b,y1 = %b,y2 = %b,y3 = %b", a,b,y0,y1,y2,y3);
    a = 1'bx; b = 1'bx; en = 0;
    #10 a = 0; b = 0; en = 1;
    #10 a = 0; b = 1; en = 1;
    #10 a = 1; b = 0; en = 1;
    #10 a = 1; b = 1; en = 1;
    #10;
  end
endmodule
