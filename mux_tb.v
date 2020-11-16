module mux_tb();
    reg [3:0] sel;
    reg [7:0] in1;
    reg [7:0] in2;
    reg [7:0] in3;
    reg [7:0] in4;
    reg [7:0] in5;
    reg [7:0] in6;
    reg [7:0] in7;
    reg [7:0] in8;
    reg [7:0] in9;
    wire [7:0] out;

    mux uut (.sel(sel), .in1(in1), .in2(in2), .in3(in3), .in4(in4), 
            .in5(in5), .in6(in6), .in7(in7), .in8(in8), .in9(in9), .out(out)
    );

    initial begin
        in1 = 8'd1;
        in2 = 8'd2;
        in3 = 8'd3;
        in4 = 8'd4;
        in5 = 8'd5;
        in6 = 8'd6;
        in7 = 8'd7;
        in8 = 8'd8;
        in9 = 8'd9;
        #100
        sel = 4'd0;
        #100
        sel = 4'd1;
        #100
        sel = 4'd3;
        #100
        sel = 4'd4;
        #100
        sel = 4'd5;
        #100
        sel = 4'd6;
        #100
        sel = 4'd7;
        #100
        sel = 4'd8;
    end
endmodule
