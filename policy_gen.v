// File     : policy_gen.v
// Brief    : module that determine next action / a(t+1) based on Q table

module policy_gen(Q_table, current_state, next_action);
    input [7:0] Q_table [17:0][3:0];
    input [17:0] current_state
    output [3:0] next_action;

    assign next_action = 

endmodule