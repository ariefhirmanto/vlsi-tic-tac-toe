module Q_updater_tb();
reg [7:0] Q, max_Q, gamma, alfa, reward;
wire [7:0] Q_new;

Q_updater uut(.Q(Q),.max_Q(max_Q),.gamma(gamma),.alfa(alfa),.reward(reward),.Q_new(Q_new));

initial 
  begin
    $display($time, " << Starting the Simulation >>");
    #100  Q= 8'd5;  gamma=8'd1; alfa=8'd1; reward=8'd0; max_Q=8'd2;
    #100  Q= 8'd5;  gamma=8'd3; alfa=8'd2; reward=8'd1; max_Q=8'd2; 
    #100  Q= 8'd5;  gamma=8'd2; alfa=8'd1; reward=8'd0; max_Q=8'd2;
    end
    initial begin
      $monitor("Q=%d, gamma=%d, alfa=%d , reward=%d, max_Q=%d, Q_new=%d",Q,gamma,alfa,reward,max_Q,Q_new);
    end
endmodule
