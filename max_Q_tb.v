module max_Q_tb;

reg [15:0] input_1;
reg [15:0] input_2;
reg [15:0] input_3;
reg [15:0] input_4;
reg [15:0] input_5;
reg [15:0] input_6;
reg [15:0] input_7;
reg [15:0] input_8;
reg [15:0] input_9;

wire [15:0] keluaran;

max_Q uut (.input_1(input_1),.input_2(input_2),
            .input_3(input_3),.input_4(input_4),
            .input_5(input_5),.input_6(input_6),
            .input_7(input_7),.input_8(input_8),
            .input_9(input_9),.keluaran(keluaran));

    initial 
        begin
            $display($time, " << Starting the Simulation >>");
            #100
            input_1 = 16'd1;
            input_2 = 16'd272;
            input_3 = 16'd3;
            input_4 = 16'd4;
            input_5 = 16'd5;
            input_6 = 16'd6;
            input_7 = 16'd7;
            input_8 = 16'd8;
            input_9 = 16'd9;
            
        end

    initial begin
        $monitor("Output = %d",keluaran);
        end
             
        
endmodule
           

            
