// File     : Q_learning.v
// Brief    : Q learning accelerator that combile all modul

module Q_learning(clock, action, state, next_state, reward, gamma, alfa, Q);
    input clock;
    input [3:0] action;
    input [17:0] state, next_state; 
    input [7:0] reward, gamma, alfa;
    output reg [7:0] Q;

    

    // modul decoder
    reg [3:0] sel;
    reg en1, en2, en3, en4, 3n5, 3n6, en7, en8, en9;

    decoder decoder_q (.sel(sel), .en1(en1), .en2(en2), .en3(en3), .en4(en4), 
                        .en5(en5), .en6(en6), .en7(en7), .en8(en8), .en9(en9)
    );
    
    // variables
    reg [17:0] read_address, write_address;
    reg [7:0] d_in;
    reg [7:0] d_out;
    
    action_ram ram_1 (.clock(clock), .write_enable(en1), .write_address(write_address), 
                        .d_in(d_in), .read_address(read_address), .d_out(d_out)
    );
    action_ram ram_2 (.clock(clock), .write_enable(en2), .write_address(write_address), 
                        .d_in(d_in), .read_address(read_address), .d_out(d_out)
    );
    action_ram ram_3 (.clock(clock), .write_enable(en3), .write_address(write_address), 
                        .d_in(d_in), .read_address(read_address), .d_out(d_out)
    );
    action_ram ram_4 (.clock(clock), .write_enable(en4), .write_address(write_address), 
                        .d_in(d_in), .read_address(read_address), .d_out(d_out)
    );
    action_ram ram_5 (.clock(clock), .write_enable(en5), .write_address(write_address), 
                        .d_in(d_in), .read_address(read_address), .d_out(d_out)
    );
    action_ram ram_6 (.clock(clock), .write_enable(en6), .write_address(write_address), 
                        .d_in(d_in), .read_address(read_address), .d_out(d_out)
    );
    action_ram ram_7 (.clock(clock), .write_enable(en7), .write_address(write_address), 
                        .d_in(d_in), .read_address(read_address), .d_out(d_out)
    );
    action_ram ram_8 (.clock(clock), .write_enable(en8), .write_address(write_address), 
                        .d_in(d_in), .read_address(read_address), .d_out(d_out)
    );
    action_ram ram_9 (.clock(clock), .write_enable(en9), .write_address(write_address), 
                        .d_in(d_in), .read_address(read_address), .d_out(d_out)
    );


    

endmodule