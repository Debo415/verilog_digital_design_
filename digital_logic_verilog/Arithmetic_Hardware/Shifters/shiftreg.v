module shift_register (
    input        clk,
    input        rst,
    input        load,
    input        serial_in,
    input  [7:0] data_in,
    output reg [7:0] q
);

always @(posedge clk) begin
    if (rst)
        q <= 8'b0;
    else if (load)
        q <= data_in;
    else
        q <= {serial_in, q[7:1]};
end

endmodule
