module reward_gen(game_state, reward);
    input [1:0] game_state;
    // 10 = agent won, 11 = agent lose, 01 = draw, 00 = continue
    // input [17:0] current_state;
    output [7:0] reward;

    reg [7:0] temp;

    always @(*)
    begin
        if (game_state == 01)
        begin
            temp <= 2;
        end
        else if (game_state == 10)
        begin
            temp <= -2;
        end
        else if (game_state == 11)
        begin
            temp <= 0;
        end
        else
        begin
            temp <= 1;
        end
    end

    assign reward = temp;

endmodule

    