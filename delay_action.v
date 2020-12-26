module delay_action(clock, data_in, data_out);
    input clock;
    input [3:0] data_in;
    reg [3:0] temp;
    output reg [3:0] data_out;

    always @(posedge clock) begin
        data_out = temp;
        temp = data_in;
    end

endmodule