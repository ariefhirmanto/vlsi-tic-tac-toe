// File     : delay_tb.v
// Brief    : testbench for delay module

module delay_tb();
    reg clock;
    reg [15:0] data_in;
    wire [15:0] data_out;

    delay uut(.clock(clock), .data_in(data_in), .data_out(data_out));
    initial begin
        clock = 1'd0;
        #100
        data_in = 16'd1;
        #200
        data_in = data_in+16'd1;
        #200
        data_in = data_in+16'd1;
        #200
        data_in = data_in+16'd1;
    end

    always begin
        #100
        clock = !clock;
    end

endmodule
