// File     : policy_gen.v
// Brief    : module that determine next action / a(t+1) based on Q table

module policy_gen(Q_table, current_state, next_action);
    input [7:0] Q_table [17:0][3:0];
    input [17:0] current_state
    output [3:0] next_action;
    reg [7:0] data_max;
    reg [3:0] temp_index; 

    max_Q max_data(
        .input_1(Q_table[current_state][0]),
        .input_2(Q_table[current_state][1]),
        .input_3(Q_table[current_state][2]),
        .input_4(Q_table[current_state][3]),
        .input_5(Q_table[current_state][4]),
        .input_6(Q_table[current_state][5]),
        .input_7(Q_table[current_state][6]),
        .input_8(Q_table[current_state][7]),
        .input_9(Q_table[current_state][8]),
        .keluaran(data_max)
    )

    always @(*)
    begin
        if (data_max == Q_table[current_state][0])
            begin
                temp_index <= 0;
            end
        else if (data_max == Q_table[current_state][1])
            begin
                temp_index <= 1;
            end
        else if (data_max == Q_table[current_state][2])
            begin
                temp_index <= 2;
            end
        else if (data_max == Q_table[current_state][3])
            begin
                temp_index <= 3;
            end
        else if (data_max == Q_table[current_state][4])
            begin
                temp_index <= 4;
            end
        else if (data_max == Q_table[current_state][4])
            begin
                temp_index <= 4;
            end
        else if (data_max == Q_table[current_state][5])
            begin
                temp_index <= 5;
            end
        else if (data_max == Q_table[current_state][6])
            begin
                temp_index <= 6;
            end
        else if (data_max == Q_table[current_state][7])
            begin
                temp_index <= 7;
            end
        else if (data_max == Q_table[current_state][8])
            begin
                temp_index <= 8;
            end
    end

    assign next_action = temp_index;

endmodule


