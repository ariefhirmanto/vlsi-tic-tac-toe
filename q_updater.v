// File     : Q_updater.v
// Brief    : Q_updater equation using direct without barrel

module Q_updater(Q, max_Q, gamma, alfa, reward, Q_new);
    // misal gamma = 
    input [15:0] Q, max_Q, gamma, alfa, reward;
    reg [15:0] eq_1; //eq_1 = gamma * maxQ
    reg [15:0] eq_2; //
    reg [15:0] temp = eq_1 + reward - Q; 
    output [15:0] Q_new;

    output [15:0] Q_new;

    barrelshifter bs_1(
        .data_in(max_Q), 
        .bit_1(gamma[0]),
        .bit_2(gamma[1]),
        .shifted(eq_1));

    barrelshifter bs_2(
        .data_in(temp), 
        .bit_1(alfa[0]),
        .bit_2(alfa[1]),
        .shifted(eq_2));

    assign Q_new = eq_1 + eq_2; //alfa * (reward + (gamma * max_Q) - Q); 

endmodule

