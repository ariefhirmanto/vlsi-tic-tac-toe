module policy_gen_tb();
    reg [17:0] Q_1;
    reg [17:0] Q_2;
    reg [17:0] Q_3;
    reg [17:0] Q_4;
    reg [17:0] Q_5;
    reg [17:0] Q_6;
    reg [17:0] Q_7;
    reg [17:0] Q_8;
    reg [17:0] Q_9;
    wire [3:0] next_action;

    policy_gen uut(
        .Q_1(Q_1),
        .Q_2(Q_2),
        .Q_3(Q_3),
        .Q_4(Q_4),
        .Q_5(Q_5),
        .Q_6(Q_6),
        .Q_7(Q_7),
        .Q_8(Q_8),
        .Q_9(Q_9),
        .next_action(next_action)
    );

    initial
    begin
       #100
       Q_1 = 18'd2;
       Q_2 = 18'd3;
       Q_3 = 18'd4;
       Q_4 = 18'd3;
       Q_5 = 18'd1;
       Q_6 = 18'd6;
       Q_7 = 18'd5;
       Q_8 = 18'd8;
       Q_9 = 18'd1;
       #200
       Q_1 = 18'd10;
       Q_2 = 18'd25;
       Q_3 = 18'd23;
       Q_4 = 18'd9;
       Q_5 = 18'd12;
       Q_6 = 18'd17;
       Q_7 = 18'd55;
       Q_8 = 18'd8;
       Q_9 = 18'd16;
       #300
       Q_9 = 18'd10;
       Q_8 = 18'd25;
       Q_7 = 18'd23;
       Q_6 = 18'd9;
       Q_5 = 18'd12;
       Q_4 = 18'd17;
       Q_3 = 18'd55;
       Q_2 = 18'd83;
       Q_1 = 18'd16;
    end

endmodule