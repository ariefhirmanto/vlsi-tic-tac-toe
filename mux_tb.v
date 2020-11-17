module mux_tb();
    reg [3:0] sel;
    reg [8:0] in1;
    reg [8:0] in2;
    reg [8:0] in3;
    reg [8:0] in4;
    reg [8:0] in5;
    reg [8:0] in6;
    reg [8:0] in7;
    reg [8:0] in8;
    reg [8:0] in9;
    wire [8:0] out;

    mux uut (.sel(sel), .in1(in1), .in2(in2), .in3(in3), .in4(in4), 
            .in5(in5), .in6(in6), .in7(in7), .in8(in8), .in9(in9), .out(out)
    );

    initial begin
        in1 = 8'd0;
        in2 = 8'd1;
        in3 = 8'd2;
        in4 = 8'd3;
        in5 = 8'd4;
        in6 = 8'd5;
        in7 = 8'd6;
        in8 = 8'd7;
        in9 = 8'd8;
        #100
        sel = 8'd0;
        #100
        sel = 8'd1;
        #100
        sel = 8'd3;
        #100
        sel = 8'd4;
        #100
        sel = 8'd5;
        #100
        sel = 8'd6;
        #100
        sel = 8'd7;
        #100
        sel = 8'd8;
    end
endmodule
