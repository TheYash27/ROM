module ROM (
    input clock,
    input enable,
    input [3:0] address,
    output reg [3:0] read_data
);

reg [3:0] ROM [15:0];

always @(posedge clock) begin
    if (enable) read_data <= ROM[address];
    else read_data <= 4'bXXXX;
end

initial begin
    ROM[0] = 4'b0000;
    ROM[1] = 4'b0001;
    ROM[2] = 4'b0010;
    ROM[3] = 4'b0011;
    ROM[4] = 4'b0100;
    ROM[5] = 4'b0101;
    ROM[6] = 4'b0110;
    ROM[7] = 4'b0111;
    ROM[8] = 4'b1000;
    ROM[9] = 4'b1001;
    ROM[10] = 4'b1010;
    ROM[11] = 4'b1011;
    ROM[12] = 4'b1100;
    ROM[13] = 4'b1101;
    ROM[14] = 4'b1110;
    ROM[15] = 4'b1111;
end
endmodule

module ROM_Test_Bench ();

    reg clock;
    reg enable;
    reg [3:0] address;
    wire [3:0] read_data;

ROM uut (
    .clock(clock),
    .enable(enable),
    .address(address),
    .read_data(read_data)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, ROM_Test_Bench);

    clock = 1'b1;
    forever #5 clock = ~clock;
end

initial begin
    enable = 1'b0;

    #10;
    enable = 1'b1;
    address = 4'd9;
end
    
endmodule