module full_a_s(
    input in1,
    input in2,
    input mode,
    input carryin,
    output sum_diff,
    output carry_borr
    );
    wire m1;
    assign m1 = mode ^ in1;
    assign sum_diff = in1^in2^carryin;
    assign carry_borr = (m1 & in2) | (m1 & carryin) | (in2 & carryin);
endmodule
