module Q_updater(Q,max_Q,gamma,alfa,reward,Q_new, eq_1, eq_2, eq_3);

input [15:0] Q;
input [3:0] gamma;
input [3:0] alfa;
input [15:0] reward;
input [15:0] max_Q;
output [15:0] Q_new;
output [15:0] eq_1;
output [15:0] eq_2;
output [15:0] eq_3;

wire [15:0] gamma_maxQ;
wire [15:0] r_plus_gammamaxQ_min_Q;
wire [15:0] alfa_kali_r_plus_gammamaxQ_min_Q;

barrel_shifter_16bit utt_1(.in(max_Q),.ctrl(gamma),.out(gamma_maxQ));
barrel_shifter_16bit utt_2(.in(r_plus_gammamaxQ_min_Q),.ctrl(alfa),.out(alfa_kali_r_plus_gammamaxQ_min_Q));

assign eq_1 = gamma_maxQ;
assign eq_2 = r_plus_gammamaxQ_min_Q;
assign eq_3 = alfa_kali_r_plus_gammamaxQ_min_Q;
assign r_plus_gammamaxQ_min_Q = reward + gamma_maxQ - Q;
assign Q_new = Q + alfa_kali_r_plus_gammamaxQ_min_Q;


endmodule
