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
        .overflow(overflow));

    // Task to display ALU results
    task display_result;
        begin
            #1;
            $display("A=%d| B=%d| Opcode=%b| Result=%d| Zero=%b | Carry=%b | Overflow=%b", A, B, opcode, result, zero, carry, overflow);
        end
    endtask

    initial begin
      repeat(5) begin
        //ADD
        A = $random;
        B = $random;
        opcode = 3'b000;
        display_result();


        // SUB
        A = $random;
        B = $random;
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

        A = $random;
        B = $random;
        opcode = 3'b100;
        display_result();

        // SHIFT LEFT
        // 00001111 << 1 = 00011110
        A = $random;
        B = $random;
        opcode = 3'b101;
        display_result();

        // MSB is shifted out → carry = 1
        A = $random;
        B = $random;
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
      end
        
        $display(" TEST COMPLETE");

        $finish;
    end

endmodule
