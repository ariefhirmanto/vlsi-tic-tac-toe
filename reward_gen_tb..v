module reward_gen_tb();
    reg [17:0] current_state;
    wire [7:0] reward;

    reward_gen uut(
        .current_state(current_state),
        .reward(reward)
    );

    initial
    begin
        current_state = 18'd000000000000000000;
        #100
        current_state = 18'd010101100110100110;
        #200
        current_state = 18'd101010011001011001;
        #300
        current_state = 18'd010101100110100110;
        #400
        current_state = 18'd000000000000000000;
    end

endmodule
