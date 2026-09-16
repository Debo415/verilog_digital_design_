module shift_register_4bit(
    input clk,
    input rst,
    input serial_in,
    output reg [3:0] q
);

always @(posedge clk) begin
    if (rst)
        q <= 4'b0000;
    else
        q <= {serial_in, q[3:1]};
end

endmodule
