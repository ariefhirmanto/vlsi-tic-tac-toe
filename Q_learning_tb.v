// File     : Q_learning_tb.v
// Brief    : Testbench foe Q_learning module

module Q_learning_tb();
    reg clock;
    reg [3:0] action;
    reg [17:0] state, next_state; 
    reg [7:0] reward, gamma, alfa;
    wire [7:0] Q_new;

    Q_learning uut(.clock(clock), .action(action), .state(state), .next_state(next_state), 
                    .reward(reward), .gamma(gamma), .alfa(alfa), .Q_new(Q_new));

    initial begin
        clock = 1'd0;
        reward = 8'd2;
        gamma = 8'd2;
        alfa = 8'd2;
        #100
        action = 4'd2;
        state = 18'b000000000000000000;
        next_state = 18'b000000000000000011;
    end

    always begin
        #100
        clock = !clock;
    end 
                
endmodule