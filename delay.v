// File     : delay.v
// Brief    : module for one cycle delay

module delay(clock, data_in, data_out);
    input clock;
    input [15:0] data_in;
    reg [15:0] temp;
    output reg [15:0] data_out;

    always @(posedge clock) begin
        data_out = temp;
        temp = data_in;
    end

endmodule
