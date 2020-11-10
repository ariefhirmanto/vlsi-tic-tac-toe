module q_updater(input_Q, Q_max, gamma, alpha, reward, Q_new);
    input [15:0] input_Q;
    input [15:0] Q_max;
    input [3:0]gamma;
    input [3:0] alpha;
    input [15:0] reward;
    output [15:0] Q_new;

    reg [3:0] input_gamma = gamma;
    reg [15:0] input_max_Q = Q_max;
    reg [3:0] input_alpha = alpha;
    reg [15:0] eq_1;
    wire [15:0] output_gamma_max_Q;
    wire [15:0] output_eq_1;
    eq_1 = output_gamma_max_Q + reward - input_Q;
    
    barrel_shifter_16bit multiply1(.in(input_max_Q), .ctrl(input_gamma), .out(output_gamma_max_Q));
    barrel_shifter_16bit multiply1(.in(eq_1), .ctrl(alpha), .out(output_eq_1));
    
    assign Q_new = output_eq_1 + input_Q;

endmodule 