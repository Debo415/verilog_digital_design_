//dadda mul
module dadda_multiplier_4bit (
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] P
);

    // Partial products
    wire pp00, pp01, pp02, pp03;
    wire pp10, pp11, pp12, pp13;
    wire pp20, pp21, pp22, pp23;
    wire pp30, pp31, pp32, pp33;

    assign pp00 = A[0] & B[0];
    assign pp01 = A[0] & B[1];
    assign pp02 = A[0] & B[2];
    assign pp03 = A[0] & B[3];

    assign pp10 = A[1] & B[0];
    assign pp11 = A[1] & B[1];
    assign pp12 = A[1] & B[2];
    assign pp13 = A[1] & B[3];

    assign pp20 = A[2] & B[0];
    assign pp21 = A[2] & B[1];
    assign pp22 = A[2] & B[2];
    assign pp23 = A[2] & B[3];

    assign pp30 = A[3] & B[0];
    assign pp31 = A[3] & B[1];
    assign pp32 = A[3] & B[2];
    assign pp33 = A[3] & B[3];

    // Reduction stage
    wire s1, c1;
    wire s2, c2;
    wire s3, c3;

    // Column 2
    assign s1 = pp02 ^ pp11 ^ pp20;
    assign c1 = (pp02 & pp11) |
                (pp11 & pp20) |
                (pp02 & pp20);

    // Column 3
    assign s2 = pp03 ^ pp12 ^ pp21;
    assign c2 = (pp03 & pp12) |
                (pp12 & pp21) |
                (pp03 & pp21);

    // Column 4
    assign s3 = pp13 ^ pp22 ^ pp31;
    assign c3 = (pp13 & pp22) |
                (pp22 & pp31) |
                (pp13 & pp31);

    // Final multiplication result
    assign P[0] = pp00;

    assign P[1] = pp01 ^ pp10;

    assign P[2] = s1 ^ c1;

    assign P[3] = s2 ^ c2;

    assign P[4] = s3 ^ pp30;

    assign P[5] = pp23 ^ pp32;

    assign P[6] = pp33;
    
    assign P[7] = 1'b0;

endmodule

