module reward_gen(state, reward);
    input [17:0] state;
    // 10 = agent won, 11 = agent lose, 01 = draw, 00 = continue
    // input [17:0] current_state;
    output [7:0] reward;

    reg [7:0] temp;

    // always @(game_state)
    // begin
    //     if (game_state == 01)
    //     begin
    //         temp <= 2;
    //     end
    //     else if (game_state == 10)
    //     begin
    //         temp <= -2;
    //     end
    //     else if (game_state == 11)
    //     begin
    //         temp <= 0;
    //     end
    //     else
    //     begin
    //         temp <= 1;
    //     end
    // end

    always @(state)
    begin
        if((state[1:0] == 2'd1 && state[9:8] == 2'd1 && state[17:16] == 2'd1) || 
                (state[5:4] == 2'd1 && state[9:8] == 2'd1 && state[13:12] == 2'd1) || 
                    (state[1:0] == 2'd1 && state[3:2] == 2'd1 && state[5:4] == 2'd1) || 
                        (state[7:6] == 2'd1 && state[9:8] == 2'd1 && state[11:10] == 2'd1) || 
                            (state[13:12] == 2'd1 && state[15:14] == 2'd1 && state[17:16] == 2'd1) || 
                                (state[1:0] == 2'd1 && state[7:6] == 2'd1 && state[13:12] == 2'd1) || 
                                    (state[3:2] == 2'd1 && state[9:8] == 2'd1 && state[15:14] == 2'd1) || 
                                        (state[5:4] == 2'd1 && state[11:10] == 2'd1 && state[17:16] == 2'd1))
                    begin
                        temp <= 2;
                    end
                // learning agent lose
                else if((state[1:0] == 2'd2 && state[9:8] == 2'd2 && state[17:16] == 2'd2) || 
                    (state[5:4] == 2'd2 && state[9:8] == 2'd2 && state[13:12] == 2'd2) || 
                        (state[1:0] == 2'd2 && state[3:2] == 2'd2 && state[5:4] == 2'd2) || 
                            (state[7:6] == 2'd2 && state[9:8] == 2'd2 && state[11:10] == 2'd2) || 
                                (state[13:12] == 2'd2 && state[15:14] == 2'd2 && state[17:16] == 2'd2) || 
                                    (state[1:0] == 2'd2 && state[7:6] == 2'd2 && state[13:12] == 2'd2) || 
                                        (state[3:2] == 2'd2 && state[9:8] == 2'd2 && state[15:14] == 2'd2) || 
                                            (state[5:4] == 2'd2 && state[11:10] == 2'd2 && state[17:16] == 2'd2))
                    begin
                        temp <= -2;
                    end
                // continue
                else if (!((state[1:0] == 2'd0) || (state[3:2] == 2'd0) || (state[5:4] == 2'd0) ||
                            (state[7:6] == 2'd0) || (state[9:8] == 2'd0) || (state[11:10] == 2'd0) ||
                            (state[13:12] == 2'd0) || (state[15:14] == 2'd0) || (state[17:16] == 2'd0))) 
                    begin
                        temp <= 0;
                    end
                // draw
                else
                    begin
                        temp <= 1;
                    end 
    end

    assign reward = temp;

endmodule

    