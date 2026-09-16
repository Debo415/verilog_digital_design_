module alu_8bit (
    input  logic [7:0] A,
    input  logic [7:0] B,
    input  logic [2:0] opcode,

    output logic [7:0] result,
    output logic       zero,
    output logic       carry,
    output logic       overflow);

    // Opcode definitions
    localparam logic [2:0] OP_ADD   = 3'b000;
    localparam logic [2:0] OP_SUB   = 3'b001;
    localparam logic [2:0] OP_AND   = 3'b010;
    localparam logic [2:0] OP_OR    = 3'b011;
    localparam logic [2:0] OP_XOR   = 3'b100;
    localparam logic [2:0] OP_SHL   = 3'b101;
    localparam logic [2:0] OP_SHR   = 3'b110;
    localparam logic [2:0] OP_CMP   = 3'b111;

    logic [8:0] arithmetic_result;

    always_comb begin

        // Default values
        result           = 8'b0;
        carry            = 1'b0;
        overflow         = 1'b0;
        arithmetic_result = 9'b0;

        // Datapath operation selected by opcode
        case (opcode)

            // ADD
            OP_ADD: begin
                arithmetic_result = {1'b0, A} + {1'b0, B};
                result = arithmetic_result[7:0];

                // Unsigned carry
                carry = arithmetic_result[8];

                // Signed overflow
                overflow = (~(A[7] ^ B[7])) &
                           (result[7] ^ A[7]);
            end

            // SUBTRACT
            OP_SUB: begin
                result = A - B;

                // Carry/borrow convention:
                // carry = 1 when A >= B
                carry = (A >= B);

                // Signed overflow
                overflow = (A[7] ^ B[7]) &
                           (result[7] ^ A[7]);
            end

            // AND
            OP_AND: begin
                result = A & B;

            // OR
            OP_OR: begin
                result = A | B;
            end

            // XOR
            OP_XOR: begin
                result = A ^ B;
            end

            // SHIFT LEFT
            OP_SHL: begin
                result = A << 1;

                // Bit shifted out
                carry = A[7];
            end

            // SHIFT RIGHT
            OP_SHR: begin
                result = A >> 1;

                // Bit shifted out
                carry = A[0];
            end

            // COMPARE
            OP_CMP: begin

                // result = 1 when A == B
                // result = 0 otherwise
                result = (A == B) ? 8'b00000001
                                  : 8'b00000000;
            end

            default: begin
                result = 8'b0;
            end

        endcase

        // ZERO FLAG
        zero = (result == 8'b0);

    end

endmodule
