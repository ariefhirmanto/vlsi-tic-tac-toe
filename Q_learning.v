// File     : Q_learning.v
// Brief    : Q learning accelerator that combile all modul

module Q_learning(clock, action, state, next_state, reward, gamma, alfa, Q);
    input clock;
    input [3:0] action;
    input [17:0] state, next_state; 
    input [7:0] reward, gamma, alfa;
    output reg [7:0] Q;

    

endmodule