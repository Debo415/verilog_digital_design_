module all_gates_tb;

    reg A, B;

    wire Y_and;
    wire Y_or;
    wire Y_nand;
    wire Y_nor;

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

    initial begin

        $monitor("A=%b B=%b | AND=%b OR=%b NAND=%b NOR=%b",
                  A, B, Y_and, Y_or, Y_nand, Y_nor);

        // Test 00
        A = 0; B = 0;
        #10;

        // Test 01
        A = 0; B = 1;
        #10;

        // Test 10
        A = 1; B = 0;
        #10;

        // Test 11
        A = 1; B = 1;
        #10;

        $finish;
    end

endmodule

