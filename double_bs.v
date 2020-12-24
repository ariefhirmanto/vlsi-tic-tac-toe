module double_bs();
    input [15:0] data_in;
    input [15:0] multiplier
    reg [15:0] temp;

    
endmodule




module barrelshifter(data_in, multiplier, shifted);
    input [15:0] data_in;
    input [3:0] multiplier;
    output [15:0] shifted;

    assign shifted = data_in >> multiplier;
endmodule