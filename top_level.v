module top_level(
    clock, 
    Q_value_act1,
    Q_value_act2,
    Q_value_act3,
    Q_value_act4,
    Q_value_act5,
    Q_value_act6,
    Q_value_act7,
    Q_value_act8,
    Q_value_act9,
    user_action,
    enable_cu,
    state_output_software,
    Q_new,
    training_flag,
    en_ram1,
    en_ram2,
    en_ram3,
    en_ram4,
    en_ram5,
    en_ram6,
    en_ram7,
    en_ram8,
    en_ram9,
    state_plus1,
    state,
    counter    
);
    input clock;
    input [15:0] Q_value_act1;
    input [15:0] Q_value_act2;
    input [15:0] Q_value_act3;
    input [15:0] Q_value_act4;
    input [15:0] Q_value_act5;
    input [15:0] Q_value_act6;
    input [15:0] Q_value_act7;
    input [15:0] Q_value_act8;
    input [15:0] Q_value_act9;
    input [3:0] user_action;
    input enable_cu;
    output [17:0] state_output_software;
    output [15:0] Q_new;
    output training_flag;
    output en_ram1;
    output en_ram2;
    output en_ram3;
    output en_ram4;
    output en_ram5;
    output en_ram6;
    output en_ram7;
    output en_ram8;
    output en_ram9;
    output [17:0] state_plus1;
    output [17:0] state;
    output [15:0] counter;

    // wire for PG
    wire [3:0] output_action_pg;
    policy_gen policy_gen (
        .Q_1(Q_value_act1), 
        .Q_2(Q_value_act2), 
        .Q_3(Q_value_act3), 
        .Q_4(Q_value_act4), 
        .Q_5(Q_value_act5), 
        .Q_6(Q_value_act6), 
        .Q_7(Q_value_act7), 
        .Q_8(Q_value_act8), 
        .Q_9(Q_value_act9), 
        .next_action(output_action_pg)
    );

    //wire for delay block
    wire [3:0] output_action_delay1;
    delay_action delay1(
        .clock(clock), 
        .data_in(output_action_pg), 
        .data_out(output_action_delay1)
    );

    // wire for reward generator
    wire [7:0] output_reward_gen;
    wire [17:0] output_state_index;
    reward_gen reward_gen(
        .state(output_state_index), 
        .reward(output_reward_gen)
    );

    //wire for delay block
    wire [7:0] output_reward_gen_delay2;
    delay_reward delay2(
        .clock(clock), 
        .data_in(output_reward_gen), 
        .data_out(output_reward_gen_delay2)
    );

    //wire for CU
    wire rst_decoder;
    wire en_stateindex;
    wire [3:0] action_output_stateindex;
    wire en_switch_action;
    wire [17:0] state_output_software_temp;
    wire training_flag_temp;
    wire [15:0] counter_temp;
    controlunit cu(
        .enable(enable_cu), 
        .clock(clock), 
        .agent_action(output_action_delay1), 
        .user_action(user_action),
        .en_switch_action(en_switch_action), 
        .output_training(training_flag_temp),
        .state(output_state_index), 
        .rst_decoder(rst_decoder), 
        .en_stateindex(en_stateindex), 
        .state_output(state_output_software_temp), 
        .action_output(action_output_stateindex),
        .counter(counter_temp)
    );

    // wire for decoder
    wire en_ram1_wire;
    wire en_ram2_wire;
    wire en_ram3_wire;
    wire en_ram4_wire;
    wire en_ram5_wire;
    wire en_ram6_wire;
    wire en_ram7_wire;
    wire en_ram8_wire;
    wire en_ram9_wire;
    decoder decode(
        .rst(rst_decoder), 
        .sel(output_action_delay1), 
        .en1(en_ram1_wire), 
        .en2(en_ram2_wire), 
        .en3(en_ram3_wire), 
        .en4(en_ram4_wire), 
        .en5(en_ram5_wire), 
        .en6(en_ram6_wire), 
        .en7(en_ram7_wire), 
        .en8(en_ram8_wire), 
        .en9(en_ram9_wire)
    );

    // wire for state index
    state_index stateindex (
        .en_switch_action(en_switch_action),
        .enable(en_stateindex), 
        .action(action_output_stateindex), 
        .state(output_state_index)       
    );

    wire [17:0] state_plus1_to_ram;
    // wire for delay 3
    delay_state delay3 (
        .clock(clock), 
        .data_in(output_state_index), 
        .data_out(state_plus1_to_ram)
    );

    // q_learning
    wire [15:0] Q_new_temp;
    Q_learning q_learning (
        .clock(clock), 
        .action(output_action_delay1), 
        .data_in1(Q_value_act1), 
        .data_in2(Q_value_act2), 
        .data_in3(Q_value_act3), 
        .data_in4(Q_value_act4), 
        .data_in5(Q_value_act5), 
        .data_in6(Q_value_act6), 
        .data_in7(Q_value_act7), 
        .data_in8(Q_value_act8), 
        .data_in9(Q_value_act9), 
        .reward(output_reward_gen_delay2), 
        .Q_new(Q_new_temp)
    );

    assign state_plus1 = state_plus1_to_ram;
    assign Q_new = Q_new_temp;
    assign en_ram1 = en_ram1_wire;
    assign en_ram2 = en_ram2_wire;
    assign en_ram3 = en_ram3_wire;
    assign en_ram4 = en_ram4_wire;
    assign en_ram5 = en_ram5_wire;
    assign en_ram6 = en_ram6_wire;
    assign en_ram7 = en_ram7_wire;
    assign en_ram8 = en_ram8_wire;
    assign en_ram9 = en_ram9_wire;
    assign state_output_software = state_output_software_temp;
    assign state = output_state_index;
    assign training_flag = training_flag_temp;
    assign counter = counter_temp;
endmodule