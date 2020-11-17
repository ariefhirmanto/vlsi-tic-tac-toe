module mux(sel, in1, in2, in3, in4, in5, in6, in7, in8, in9, out);
    input [3:0] sel;
    input [7:0] in1;
    input [7:0] in2;
    input [7:0] in3;
    input [7:0] in4;
    input [7:0] in5;
    input [7:0] in6;
    input [7:0] in7;
    input [7:0] in8;
    input [7:0] in9;
    output reg [7:0] out;

    always @(*) begin
        case(sel)
            4'd0: out <= in1;
            4'd1: out <= in2;
            4'd2: out <= in3;
            4'd3: out <= in4;
            4'd4: out <= in5;
            4'd5: out <= in6;
            4'd6: out <= in7;
            4'd7: out <= in8;
            4'd8: out <= in9;
        endcase
    end
endmodule
