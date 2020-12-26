module delay_reward(clock, data_in, data_out);
    input clock;
    input [7:0] data_in;
    reg [7:0] temp;
    output reg [7:0] data_out;

    always @(posedge clock) begin
        data_out = temp;
        temp = data_in;
    end

endmodule