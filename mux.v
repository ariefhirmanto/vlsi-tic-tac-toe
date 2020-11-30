module mux(sel, in1, in2, in3, in4, in5, in6, in7, in8, in9, out);
    input [3:0] sel;
    input [15:0] in1;
    input [15:0] in2;
    input [15:0] in3;
    input [15:0] in4;
    input [15:0] in5;
    input [15:0] in6;
    input [15:0] in7;
    input [15:0] in8;
    input [15:0] in9;
    output [15:0] out;
    reg [15:0] out;

    always @(sel)
    begin
        case(sel)
        16'd0: out <= in1;
        16'd1: out <= in2;
        16'd2: out <= in3;
        16'd3: out <= in4;
        16'd4: out <= in5;
        16'd5: out <= in6;
        16'd6: out <= in7;
        16'd7: out <= in8;
        16'd8: out <= in9;
        endcase
    end
endmodule
