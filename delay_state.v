module delay_state(clock, data_in, data_out);
    input clock;
    input [17:0] data_in;
    reg [17:0] temp;
    output reg [17:0] data_out;

    always @(posedge clock) begin
        data_out = temp;
        temp = data_in;
    end

endmodule