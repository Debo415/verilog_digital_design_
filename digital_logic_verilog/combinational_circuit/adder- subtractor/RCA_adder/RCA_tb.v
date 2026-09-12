module RippleCarryAdder_4bit_testbench;
  reg [3:0] A, B;
  wire [3:0] sum;
  wire cout;
  RippleCarryAdder_4bit uut(.A(A), .B(B), .sum(sum), .cout(cout));
  initial begin
    repeat (10) begin
      A = $urandom_range(0,15);
      B = $urandom_range(0,15);
      $display("A = %d, B = %d", A, B);
      #10;
      $display("Sum = %d, Carry = %d", sum, cout);
    end
    $finish;
  end
endmodule
