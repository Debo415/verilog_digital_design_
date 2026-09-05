module all_gates_tb;

    reg A, B;

    wire Y_and;
    wire Y_or;
    wire Y_nand;
    wire Y_nor;
    wire Y_xor;

    // Instantiate AND gate
    and_gate AND1 (
        .A(A),
        .B(B),
        .Y(Y_and)
    );

    // Instantiate OR gate
    or_gate OR1 (
        .A(A),
        .B(B),
        .Y(Y_or)
    );

    // Instantiate NAND gate
    nand_gate NAND1 (
        .A(A),
        .B(B),
        .Y(Y_nand)
    );

    // Instantiate NOR gate
    nor_gate NOR1 (
        .A(A),
        .B(B),
        .Y(Y_nor)
    );

    // Instantaneous XOR gate
    xor_gate XOR1 (
        .A(A), .B(B), .Y(Y_xor) );

    initial begin

        $monitor("A=%b B=%b | AND=%b OR=%b NAND=%b NOR=%b",
                  A, B, Y_and, Y_or, Y_nand, Y_nor, Y_xor);

        // Test with loop
        reg A,B;
        integer i;
        for(i=0; i<4; i=i+1) begin
                A=i/2;
                B=i%2;
                #10;
            end
        end
        $finish;
    end

endmodule

