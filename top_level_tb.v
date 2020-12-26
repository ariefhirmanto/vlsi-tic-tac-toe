module top_level_tb();
    reg clock;
    reg [15:0] Q_value_act1;
    reg [15:0] Q_value_act2;
    reg [15:0] Q_value_act3;
    reg [15:0] Q_value_act4;
    reg [15:0] Q_value_act5;
    reg [15:0] Q_value_act6;
    reg [15:0] Q_value_act7;
    reg [15:0] Q_value_act8;
    reg [15:0] Q_value_act9;
    reg [3:0] user_action;
    reg enable_cu;
    wire [17:0] state_output_software;
    wire [15:0] Q_new;
    wire training_flag;
    wire en_ram1;
    wire en_ram2;
    wire en_ram3;
    wire en_ram4;
    wire en_ram5;
    wire en_ram6;
    wire en_ram7;
    wire en_ram8;
    wire en_ram9;
    wire [17:0] state_plus1;
    wire [17:0] state;
    wire [15:0] counter;

    top_level tb(
        .clock(clock), 
        .Q_value_act1(Q_value_act1),
        .Q_value_act2(Q_value_act2),
        .Q_value_act3(Q_value_act3),
        .Q_value_act4(Q_value_act4),
        .Q_value_act5(Q_value_act5),
        .Q_value_act6(Q_value_act6),
        .Q_value_act7(Q_value_act7),
        .Q_value_act8(Q_value_act8),
        .Q_value_act9(Q_value_act9),
        .user_action(user_action),
        .enable_cu(enable_cu),
        .state_output_software(state_output_software),
        .Q_new(Q_new),
        .training_flag(training_flag),
        .en_ram1(en_ram1),
        .en_ram2(en_ram2),
        .en_ram3(en_ram3),
        .en_ram4(en_ram4),
        .en_ram5(en_ram5),
        .en_ram6(en_ram6),
        .en_ram7(en_ram7),
        .en_ram8(en_ram8),
        .en_ram9(en_ram9),
        .state_plus1(state_plus1),
        .state(state),
        .counter(counter)
    );

    initial
    begin
        user_action = 4'd0;
        clock = 1'd0;
        enable_cu = 1'd1;
        Q_value_act1 = 16'd0;
        Q_value_act2 = 16'd0;
        Q_value_act3 = 16'd0;
        Q_value_act4 = 16'd0;
        Q_value_act5 = 16'd0;
        Q_value_act6 = 16'd0;
        Q_value_act7 = 16'd0;
        Q_value_act8 = 16'd0;
        Q_value_act9 = 16'd0;
        #100
        enable_cu = 1'd0;
        user_action = 4'd2;
        Q_value_act1 = 16'd12;
        Q_value_act2 = 16'd10;
        Q_value_act3 = 16'd13;
        Q_value_act4 = 16'd17;
        Q_value_act5 = 16'd18;
        Q_value_act6 = 16'd32;
        Q_value_act7 = 16'd62;
        Q_value_act8 = 16'd8;
        Q_value_act9 = 16'd1;
        #200
        enable_cu = 1'd1;
        user_action = 4'd4;
        Q_value_act1 = 16'd10;
        Q_value_act2 = 16'd12;
        Q_value_act3 = 16'd17;
        Q_value_act4 = 16'd13;
        Q_value_act5 = 16'd32;
        Q_value_act6 = 16'd18;
        Q_value_act7 = 16'd6;
        Q_value_act8 = 16'd8;
        Q_value_act9 = 16'd9;
        #300
        user_action = 4'd6;
        Q_value_act1 = 16'd10;
        Q_value_act2 = 16'd12;
        Q_value_act3 = 16'd17;
        Q_value_act4 = 16'd13;
        Q_value_act5 = 16'd32;
        Q_value_act6 = 16'd18;
        Q_value_act7 = 16'd6;
        Q_value_act8 = 16'd8;
        Q_value_act9 = 16'd9;
        #400
        user_action = 4'd5;
        Q_value_act1 = 16'd17;
        Q_value_act2 = 16'd13;
        Q_value_act3 = 16'd10;
        Q_value_act4 = 16'd12;
        Q_value_act5 = 16'd18;
        Q_value_act6 = 16'd32;
        Q_value_act7 = 16'd9;
        Q_value_act8 = 16'd6;
        Q_value_act9 = 16'd8;
        #500
        user_action = 4'd7;
        Q_value_act1 = 16'd11;
        Q_value_act2 = 16'd12;
        Q_value_act3 = 16'd13;
        Q_value_act4 = 16'd14;
        Q_value_act5 = 16'd35;
        Q_value_act6 = 16'd16;
        Q_value_act7 = 16'd2;
        Q_value_act8 = 16'd0;
        Q_value_act9 = 16'd1;
    end

    always
    begin
        #100 clock = !clock;
    end

endmodule