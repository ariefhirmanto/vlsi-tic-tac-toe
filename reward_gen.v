module reward_gen(current_state, reward);
    input [17:0] current_state;
    output [7:0] reward;

    reg [7:0] temp;

    always @(*)
    begin
        // learning agent win
       if((current_state[1:0] == 2'd1 && current_state[9:8] == 2'd1 && current_state[17:16] == 2'd1) || 
        (current_state[5:4] == 2'd1 && current_state[9:8] == 2'd1 && current_state[13:12] == 2'd1) || 
            (current_state[1:0] == 2'd1 && current_state[3:2] == 2'd1 && current_state[5:4] == 2'd1) || 
                (current_state[7:6] == 2'd1 && current_state[9:8] == 2'd1 && current_state[11:10] == 2'd1) || 
                    (current_state[13:12] == 2'd1 && current_state[15:14] == 2'd1 && current_state[17:16] == 2'd1) || 
                        (current_state[1:0] == 2'd1 && current_state[7:6] == 2'd1 && current_state[13:12] == 2'd1) || 
                            (current_state[3:2] == 2'd1 && current_state[9:8] == 2'd1 && current_state[15:14] == 2'd1) || 
                                (current_state[5:4] == 2'd1 && current_state[11:10] == 2'd1 && current_state[17:16] == 2'd1))
            begin
                temp <= 2;
            end
        // learning agent lose
        else if((current_state[1:0] == 2'd2 && current_state[9:8] == 2'd2 && current_state[17:16] == 2'd2) || 
            (current_state[5:4] == 2'd2 && current_state[9:8] == 2'd2 && current_state[13:12] == 2'd2) || 
                (current_state[1:0] == 2'd2 && current_state[3:2] == 2'd2 && current_state[5:4] == 2'd2) || 
                    (current_state[7:6] == 2'd2 && current_state[9:8] == 2'd2 && current_state[11:10] == 2'd2) || 
                        (current_state[13:12] == 2'd2 && current_state[15:14] == 2'd2 && current_state[17:16] == 2'd2) || 
                            (current_state[1:0] == 2'd2 && current_state[7:6] == 2'd2 && current_state[13:12] == 2'd2) || 
                                (current_state[3:2] == 2'd2 && current_state[9:8] == 2'd2 && current_state[15:14] == 2'd2) || 
                                    (current_state[5:4] == 2'd2 && current_state[11:10] == 2'd2 && current_state[17:16] == 2'd2))
            begin
                temp <= -2;
            end
        // match draw
        else if (!((current_state[1:0] == 2'd0) || (current_state[3:2] == 2'd0) || (current_state[5:4] == 2'd0) ||
                    (current_state[7:6] == 2'd0) || (current_state[9:8] == 2'd0) || (current_state[11:10] == 2'd0) ||
                    (current_state[13:12] == 2'd0) || (current_state[15:14] == 2'd0) || (current_state[17:16] == 2'd0))) 
            begin
                temp <= 0;
            end
        // continue
        else
            begin
                temp <= 1;
            end 
    end

    assign reward = temp;

endmodule

    