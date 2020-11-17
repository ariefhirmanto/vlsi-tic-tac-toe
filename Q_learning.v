// File     : Q_learning.v
// Brief    : Q learning accelerator that combile all modul

module Q_learning(clock, action, state, next_state, reward, gamma, alfa, Q_new);
    input clock;
    input [3:0] action;
    input [17:0] state, next_state; 
    input [7:0] reward, gamma, alfa;
    output [7:0] Q_new;

    // modul decoder
    wire en1, en2, en3, en4, en5, en6, en7, en8, en9;
    wire [7:0] Q_new_temp;

    decoder decoder_0 (.sel(action), .en1(en1), .en2(en2), .en3(en3), .en4(en4), 
                        .en5(en5), .en6(en6), .en7(en7), .en8(en8), .en9(en9)
    );
    
    // action_ram
    reg [17:0] read_address, write_address;
    wire [7:0] d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7, d_out8, d_out9;
    
    action_ram ram_1 (.clock(clock), .write_enable(en1), .write_address(write_address), 
                        .d_in(Q_new_temp), .read_address(read_address), .d_out(d_out1)
    );
    action_ram ram_2 (.clock(clock), .write_enable(en2), .write_address(write_address), 
                        .d_in(Q_new_temp), .read_address(read_address), .d_out(d_out2)
    );
    action_ram ram_3 (.clock(clock), .write_enable(en3), .write_address(write_address), 
                        .d_in(Q_new_temp), .read_address(read_address), .d_out(d_out3)
    );
    action_ram ram_4 (.clock(clock), .write_enable(en4), .write_address(write_address), 
                        .d_in(Q_new_temp), .read_address(read_address), .d_out(d_out4)
    );
    action_ram ram_5 (.clock(clock), .write_enable(en5), .write_address(write_address), 
                        .d_in(Q_new_temp), .read_address(read_address), .d_out(d_out5)
    );
    action_ram ram_6 (.clock(clock), .write_enable(en6), .write_address(write_address), 
                        .d_in(Q_new_temp), .read_address(read_address), .d_out(d_out6)
    );
    action_ram ram_7 (.clock(clock), .write_enable(en7), .write_address(write_address), 
                        .d_in(Q_new_temp), .read_address(read_address), .d_out(d_out7)
    );
    action_ram ram_8 (.clock(clock), .write_enable(en8), .write_address(write_address), 
                        .d_in(Q_new_temp), .read_address(read_address), .d_out(d_out8)
    );
    action_ram ram_9 (.clock(clock), .write_enable(en9), .write_address(write_address), 
                        .d_in(Q_new_temp), .read_address(read_address), .d_out(d_out9)
    );

    // delay
    wire [7:0] d_out1_del, d_out2_del, d_out3_del, d_out4_del, d_out5_del;
    wire [7:0] d_out6_del, d_out7_del, d_out8_del, d_out9_del;

    delay delay_1 (.clock(clock), .data_in(d_out1), .data_out(d_out1_del));
    delay delay_2 (.clock(clock), .data_in(d_out2), .data_out(d_out2_del));
    delay delay_3 (.clock(clock), .data_in(d_out3), .data_out(d_out3_del));
    delay delay_4 (.clock(clock), .data_in(d_out4), .data_out(d_out4_del));
    delay delay_5 (.clock(clock), .data_in(d_out5), .data_out(d_out5_del));
    delay delay_6 (.clock(clock), .data_in(d_out6), .data_out(d_out6_del));
    delay delay_7 (.clock(clock), .data_in(d_out7), .data_out(d_out7_del));
    delay delay_8 (.clock(clock), .data_in(d_out8), .data_out(d_out8_del));
    delay delay_9 (.clock(clock), .data_in(d_out9), .data_out(d_out9_del));
    
    // mux
    wire [7:0] Q_out_mux;
    mux mux_0 (.sel(action), .in1(d_out1_del), .in2(d_out2_del), .in3(d_out3_del), 
                .in4(d_out4_del), .in5(d_out5_del), .in6(d_out6_del), .in7(d_out7_del), 
                .in8(d_out8_del), .in9(d_out9_del), .out(Q_out_mux) 
    );

    // max
    wire [7:0] Q_max;
    max_Q max_Q_0 (.input_1(d_out1), .input_2(d_out2), .input_3(d_out3), .input_4(d_out4), 
                .input_5(d_out5), .input_6(d_out6), .input_7(d_out7), .input_8(d_out8),
                .input_9(d_out9), .keluaran(Q_max)
    );

    // Q_updater 
    Q_updater Q_updater_0 (.Q(Q_out_mux), .max_Q(Q_max), .gamma(gamma), .alfa(alfa), 
                            .reward(reward), .Q_new(Q_new_temp)
    );

    assign Q_new = Q_new_temp;
                
endmodule