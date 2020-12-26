module controlunit_tb();
    reg enable;
    reg clock;
    reg [3:0] agent_action;
    reg [3:0] user_action;
    reg [17:0] state;
    wire en_switch_action;
    wire rst_decoder;
    wire en_stateindex;
    wire output_training;
    // 01 agent, 10 player
    wire [17:0] state_output;
    wire [3:0] action_output;
    wire [15:0] counter;

    controlunit cu (
        .enable(enable), 
        .clock(clock), 
        .agent_action(agent_action), 
        .user_action(user_action), 
        .state(state), 
        .rst_decoder(rst_decoder), 
        .en_stateindex(en_stateindex), 
        .en_switch_action(en_switch_action), 
        .state_output(state_output), 
        .action_output(action_output), 
        .output_training(output_training), 
        .counter(counter)
    );

    initial begin
        clock = 1'd0;
        enable = 1'd0;
        #100
        enable = 1'd1;
        agent_action = 4'd2;
        user_action = 4'd3;
        state = 18'd8;
        #100
        agent_action = 4'd4;
        user_action = 4'd13;
        state = 18'd100;
        #100
        enable = 1'd0;
        agent_action = 4'd2;
        user_action = 4'd3;
        state = 18'd8;
        #100
        enable = 1'd1;
        agent_action = 4'd2;
        user_action = 4'd3;
        state = 18'd8;
    end

    always begin
        #100 clock = !clock;
    end
endmodule