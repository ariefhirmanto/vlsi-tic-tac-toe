// File     : Q_learning_tb.v
// Brief    : Testbench foe Q_learning module

module Q_learning_tb();
    reg clock;
    reg [3:0] action;
    reg [15:0] reward;
    reg [15:0] data_in1; //bikin 9
    reg [15:0] data_in2;
    reg [15:0] data_in3;
    reg [15:0] data_in4;
    reg [15:0] data_in5;
    reg [15:0] data_in6;
    reg [15:0] data_in7;
    reg [15:0] data_in8;
    reg [15:0] data_in9;
    wire [15:0] Q_new;
    wire [15:0] Q_max_debug;
    wire [15:0] Q_out_mux_debug;
    Q_learning uut(
        .clock(clock), 
        .action(action), 
        .data_in1(data_in1), 
        .data_in2(data_in2), 
        .data_in3(data_in3), 
        .data_in4(data_in4), 
        .data_in5(data_in5), 
        .data_in6(data_in6), 
        .data_in7(data_in7), 
        .data_in8(data_in8), 
        .data_in9(data_in9), 
        .reward(reward), 
        .Q_new(Q_new),
        .Q_max_debug(Q_max_debug),
        .Q_out_mux_debug(Q_out_mux_debug)
    );

    initial begin
        clock = 1'd0;
        reward = 16'd2;
        data_in1 = 16'd0;
        data_in2 = 16'd0;
        data_in3 = 16'd0;
        data_in4 = 16'd0;
        data_in5 = 16'd0;
        data_in6 = 16'd0;
        data_in7 = 16'd0;
        data_in8 = 16'd0;
        data_in9 = 16'd0;
        #100
        reward = 16'd1;
        action = 4'd7;
        data_in1 = 16'd12;
        data_in2 = 16'd10;
        data_in3 = 16'd13;
        data_in4 = 16'd17;
        data_in5 = 16'd18;
        data_in6 = 16'd32;
        data_in7 = 16'd62;
        data_in8 = 16'd8;
        data_in9 = 16'd1;
        #200
        reward = 16'd0;
        action = 4'd3;
        data_in1 = 16'd10;
        data_in2 = 16'd12;
        data_in3 = 16'd17;
        data_in4 = 16'd13;
        data_in5 = 16'd32;
        data_in6 = 16'd18;
        data_in7 = 16'd6;
        data_in8 = 16'd8;
        data_in9 = 16'd9;
        #300
        reward = 16'd2;
        action = 4'd6;
        data_in1 = 16'd10;
        data_in2 = 16'd12;
        data_in3 = 16'd17;
        data_in4 = 16'd13;
        data_in5 = 16'd32;
        data_in6 = 16'd18;
        data_in7 = 16'd6;
        data_in8 = 16'd8;
        data_in9 = 16'd9;
    end

    always begin
        #100
        clock = !clock;
    end 
                
endmodule