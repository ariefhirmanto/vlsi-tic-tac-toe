module mux_tb();
    reg [3:0] sel;
    reg [15:0] in1;
    reg [15:0] in2;
    reg [15:0] in3;
    reg [15:0] in4;
    reg [15:0] in5;
    reg [15:0] in6;
    reg [15:0] in7;
    reg [15:0] in8;
    reg [15:0] in9;
    wire [15:0] out;

    mux uut (.sel(sel), .in1(in1), .in2(in2), .in3(in3), .in4(in4), 
            .in5(in5), .in6(in6), .in7(in7), .in8(in8), .in9(in9), .out(out)
    );

    initial begin
        in1 = 16'd0;
        in2 = 16'd1;
        in3 = 16'd2;
        in4 = 16'd3;
        in5 = 16'd4;
        in6 = 16'd5;
        in7 = 16'd6;
        in8 = 16'd7;
        in9 = 16'd8;
        #100
        sel = 16'd0;
        #100
        sel = 16'd1;
        #100
        sel = 16'd3;
        #100
        sel = 16'd4;
        #100
        sel = 16'd5;
        #100
        sel = 16'd6;
        #100
        sel = 16'd7;
        #100
        sel = 16'd8;
    end
endmodule
