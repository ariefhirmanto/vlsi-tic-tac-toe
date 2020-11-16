module max_Q_tb;

reg [7:0] input_1;
reg [7:0] input_2;
reg [7:0] input_3;
reg [7:0] input_4;
reg [7:0] input_5;
reg [7:0] input_6;
reg [7:0] input_7;
reg [7:0] input_8;
reg [7:0] input_9;

wire [7:0] keluaran;

max_Q uut (.input_1(input_1),.input_2(input_2),
            .input_3(input_3),.input_4(input_4),
            .input_5(input_5),.input_6(input_6),
            .input_7(input_7),.input_8(input_8),
            .input_9(input_9),.keluaran(keluaran));

    initial 
        begin
            $display($time, " << Starting the Simulation >>");
            #100
            input_1 = 8'd1;
            input_2 = 8'd212;
            input_3 = 8'd3;
            input_4 = 8'd4;
            input_5 = 8'd5;
            input_6 = 8'd6;
            input_7 = 8'd7;
            input_8 = 8'd8;
            input_9 = 8'd9;
            #100
            input_1 = 8'd1;
            input_2 = 8'd22;
            input_3 = 8'd3;
            input_4 = 8'd45;
            input_5 = 8'd5;
            input_6 = 8'd6;
            input_7 = 8'd7;
            input_8 = 8'd8;
            input_9 = 8'd9;
            
        end

    initial begin
        $monitor("Output = %d",keluaran);
        end
             
        
endmodule
           

            
