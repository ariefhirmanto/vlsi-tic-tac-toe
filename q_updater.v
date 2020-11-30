// File     : Q_updater.v
// Brief    : Q_updater equation using direct without barrel

module Q_updater(Q, max_Q, gamma, alfa, reward, Q_new);

input [15:0] Q, max_Q, gamma, alfa, reward;
output [15:0] Q_new;

assign Q_new = Q + alfa * (reward + (gamma * max_Q) - Q); 

endmodule
