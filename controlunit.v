module controlunit(enable, clock, agent_action, user_action, state, rst_decoder, en_stateindex, en_switch_action, state_output, action_output, output_training, counter);
    input enable;
    input clock;
    input [3:0] agent_action;
    input [3:0] user_action;
    input [17:0] state;
    output reg en_switch_action;
    output reg rst_decoder;
    output reg en_stateindex;
    output reg output_training;
    // 01 agent, 10 player
    output [17:0] state_output;
    output [3:0] action_output;
    output [15:0] counter;
    reg [15:0] counter_temp;
    reg [3:0] temp_action;
    reg [17:0] temp_state;

    always @(posedge clock)
    begin
        if (!enable)
        begin
            counter_temp <= 16'd0;
        end
        else
        begin
            counter_temp <= counter_temp + 16'd1;
        end
    end

    always @(posedge clock)
    begin
        if (!enable)
        begin
            temp_state <= state;
            output_training <= 1'd0;
            rst_decoder <= 1'd1;
            en_stateindex <= 1'd0;
        end
        else
        begin
            temp_state <= state;
            if (counter_temp <= 16'd16)
            begin
                output_training <= 1'd1;
                rst_decoder <= 1'd0;
                en_stateindex <= 1'd1;
                if (counter_temp % 2 == 1)
                begin
                    en_switch_action <= 1'd1;
                    temp_action <= agent_action;
                end
                else
                begin
                    en_switch_action <= 1'd0;
                    temp_action <= user_action;
                end
            end
            else 
            begin
                output_training <= 1'd0;
                rst_decoder <= 1'd1;
                en_stateindex <= 1'd0;
            end
        end
    end
    assign state_output = temp_state;
    assign action_output = temp_action;
    assign counter = counter_temp;
endmodule