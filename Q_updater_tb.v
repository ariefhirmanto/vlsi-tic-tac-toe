module Q_updater_tb();
reg [15:0] Q, max_Q, reward;
wire [15:0] Q_new;

Q_updater uut(
  .Q(Q), 
  .max_Q(max_Q), 
  .reward(reward), 
  .Q_new(Q_new)
);

initial 
  begin
    $display($time, " << Starting the Simulation >>");
    #100  Q= 16'd5; reward=16'd0; max_Q=16'd2;
    #100  Q= 16'd5; reward=16'd1; max_Q=16'd2; 
    #100  Q= 16'd5; reward=16'd2; max_Q=16'd2;
    end
endmodule
