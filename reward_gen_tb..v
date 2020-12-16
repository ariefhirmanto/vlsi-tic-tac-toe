module reward_gen_tb();
    reg [1:0] game_state;
    wire [7:0] reward;

    reward_gen uut(
        .game_state(game_state),
        .reward(reward)
    );

    initial
    begin
        game_state = 00;
        #100
        game_state = 01;
        #200
        game_state = 11;
        #300
        game_state = 10;
        #400
        game_state = 00;
    end

endmodule
