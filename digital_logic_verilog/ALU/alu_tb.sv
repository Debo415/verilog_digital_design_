`timescale 1ns/1ps
module tb_alu_8bit;

    // Inputs
    logic [7:0] A;
    logic [7:0] B;
    logic [2:0] opcode;

    // Outputs
    logic [7:0] result;
    logic       zero;
    logic       carry;
    logic       overflow;

    // Instantiate ALU
    alu_8bit dut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .zero(zero),
        .carry(carry),
        .overflow(overflow) );

    // Task to display ALU results
    task display_result;
        begin
            #1;
          $display( "A=%d | B=%d | Opcode=%b | Result=%d | Zero=%b | Carry=%b | Overflow=%b", A, B, opcode, result, zero, carry, overflow);
        end
    endtask

    initial begin
        $dumpfile("alu_8bit.vcd");
        $dumpvars(0, tb_alu_8bit);
      
        // ADDITION
        // 5 + 3 = 8
        A = 8'd5;
        B = 8'd3;
        opcode = 3'b000;
        display_result();

        // 255 + 1 = 0 with carry
        A = 8'd255;
        B = 8'd1;
        opcode = 3'b000;
        display_result();

        // Signed overflow: 127 + 1
        A = 8'd127;
        B = 8'd1;
        opcode = 3'b000;
        display_result();

        // SUBTRACTION
        // 10 - 3 = 7
        A = 8'd10;
        B = 8'd3;
        opcode = 3'b001;
        display_result();

        // 3 - 10 = 249 (-7 in signed 8-bit)
        A = 8'd3;
        B = 8'd10;
        opcode = 3'b001;
        display_result();

        // 5 - 5 = 0
        A = 8'd5;
        B = 8'd5;
        opcode = 3'b001;
        display_result();

        // AND
        A = 8'b10101010;
        B = 8'b11110000;
        opcode = 3'b010;
        display_result();

        // OR
         A = 8'b10101010;
        B = 8'b11110000;
        opcode = 3'b011;
        display_result();

        // XOR
        A = 8'b10101010;
        B = 8'b11110000;
        opcode = 3'b100;
        display_result();

        // SHIFT LEFT
        // 00001111 << 1 = 00011110
        A = 8'b00001111;
        B = 8'b00000000;
        opcode = 3'b101;
        display_result();

        // MSB is shifted out → carry = 1
        A = 8'b10000001;
        B = 8'b00000000;
        opcode = 3'b101;
        display_result();

        // SHIFT RIGHT

        // 11110000 >> 1 = 01111000
        A = 8'b11110000;
        B = 8'b00000000;
        opcode = 3'b110;
        display_result();

        // LSB is shifted out → carry = 1
        A = 8'b00000001;
        B = 8'b00000000;
        opcode = 3'b110;
        display_result();

        // COMPARE

        // 5 == 5 → result = 1
        A = 8'd5;
        B = 8'd5;
        opcode = 3'b111;
        display_result();

        // 5 == 3 → result = 0
        A = 8'd5;
        B = 8'd3;
        opcode = 3'b111;
        display_result();

        $display("TEST COMPLETE");
        $finish;
    end

endmodule
