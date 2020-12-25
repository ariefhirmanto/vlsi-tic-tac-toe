// File     : policy_gen.v
// Brief    : module that determine next action / a(t+1) based on Q table

module policy_gen(rst, Q_1, Q_2, Q_3, Q_4, Q_5, Q_6, Q_7, Q_8, Q_9, next_action);
    input rst;
    input [17:0] Q_1;
    input [17:0] Q_2;
    input [17:0] Q_3;
    input [17:0] Q_4;
    input [17:0] Q_5;
    input [17:0] Q_6;
    input [17:0] Q_7;
    input [17:0] Q_8;
    input [17:0] Q_9;
    output [3:0] next_action;
    wire [17:0] data_max;
    reg [3:0] temp_index; 

    max_Q_18bit max_data(
        .input_1(Q_1),
        .input_2(Q_2),
        .input_3(Q_3),
        .input_4(Q_4),
        .input_5(Q_5),
        .input_6(Q_6),
        .input_7(Q_7),
        .input_8(Q_8),
        .input_9(Q_9),
        .keluaran(data_max)
    );

    always @(*)
    begin
            if (data_max == Q_1)
                begin
                    temp_index <= 0;
                end
            else if (data_max == Q_2)
                begin
                    temp_index <= 1;
                end
            else if (data_max == Q_3)
                begin
                    temp_index <= 2;
                end
            else if (data_max == Q_4)
                begin
                    temp_index <= 3;
                end
            else if (data_max == Q_5)
                begin
                    temp_index <= 4;
                end
            else if (data_max == Q_6)
                begin
                    temp_index <= 5;
                end
            else if (data_max == Q_7)
                begin
                    temp_index <= 6;
                end
            else if (data_max == Q_8)
                begin
                    temp_index <= 7;
                end
            else if (data_max == Q_9)
                begin
                    temp_index <= 8;
                end 
    end

    assign next_action = temp_index;

endmodule


