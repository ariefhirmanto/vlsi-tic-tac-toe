module mux(sel, in1, in2, in3, in4, in5, in6, in7, in8, in9, out);
    input [3:0] sel;
    input [8:0] in1;
    input [8:0] in2;
    input [8:0] in3;
    input [8:0] in4;
    input [8:0] in5;
    input [8:0] in6;
    input [8:0] in7;
    input [8:0] in8;
    input [8:0] in9;
    output [8:0] out;
    reg [8:0] out;

    always @(sel)
    begin
        case(sel)
        8'd0: out <= in1;
        8'd1: out <= in2;
        8'd2: out <= in3;
        8'd3: out <= in4;
        8'd4: out <= in5;
        8'd5: out <= in6;
        8'd6: out <= in7;
        8'd7: out <= in8;
        8'd8: out <= in9;
        endcase
    end
endmodule
