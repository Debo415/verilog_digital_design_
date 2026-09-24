module rom(data, addr, read, ena);
input read, ena;
input [7:0] addr;
output [7:0] data;

reg [7:0] memory[255:0];


// note: Decimal number in the bracket
initial begin
    memory[0] = 8'b000_00000;   //NOP
    ... // some instructions
end

assign data = (read&&ena)? memory[addr]:8'hzz;

endmodule
