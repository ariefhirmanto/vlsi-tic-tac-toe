// File     : Q_updater.v
// Brief    : Q_updater equation using direct without barrel

module Q_updater(Q, max_Q, reward, Q_new);
    // misal gamma = 
    input [15:0] Q, max_Q; 
    input [7:0] reward;
    wire [15:0] eq_1; //eq_1 = gamma * maxQ
    wire [15:0] eq_2; //
    wire [15:0] temp; 
    output [15:0] Q_new;
    reg [3:0] gamma_bit_1 = 4'd2;
    reg [3:0] gamma_bit_2 = 4'd0;
    reg [3:0] alfa_bit_1 = 4'd1;
    reg [3:0] alfa_bit_2 = 4'd3; 
    
    barrelshifter bs_1(
        .data_in(max_Q), 
        .bit_1(gamma_bit_1),
        .bit_2(gamma_bit_2),
        .shifted(eq_1));

    barrelshifter bs_2(
        .data_in(temp), 
        .bit_1(alfa_bit_1),
        .bit_2(alfa_bit_2),
        .shifted(eq_2));

    assign temp = eq_1 + reward - Q;
    assign Q_new = Q + eq_2; //alfa * (reward + (gamma * max_Q) - Q); 

endmodule

