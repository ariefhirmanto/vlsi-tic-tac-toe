module Q_updater_tb();
reg [15:0] Q;
reg [3:0] gamma;
reg [3:0] alfa;
reg [15:0] reward;
reg [15:0] max_Q;
wire [15:0] Q_new;
wire [15:0] eq_1;
wire [15:0] eq_2;
wire [15:0] eq_3;

Q_updater uut(.Q(Q),.gamma(gamma),.alfa(alfa),.reward(reward),.max_Q(max_Q),.Q_new(Q_new), .eq_1(eq_1), .eq_2(eq_2), .eq_3(eq_3));

initial 
 begin
    $display($time, " << Starting the Simulation >>");
        Q= 16'd0;  gamma=4'd1; alfa=4'd1; reward=16'd100; max_Q=16'd43;
    #100  Q= 16'd45;  gamma=4'd1; alfa=4'd1; reward=16'd0; max_Q=16'd67;
    #100  Q= 16'd10;  gamma=4'd3; alfa=4'd2; reward=16'd100; max_Q=16'd43; 
    #100  Q= 16'd10;  gamma=4'd2; alfa=4'd1; reward=16'd0; max_Q=16'd67;
    end
    initial begin
      $monitor("Q=%d, gamma=%d, alfa=%d , reward=%d, max_Q=%d, Q_new=%d",Q,gamma,alfa,reward,max_Q,Q_new);
    end
endmodule
