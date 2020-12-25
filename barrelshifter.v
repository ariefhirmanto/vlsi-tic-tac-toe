module barrelshifter(data_in, bit_1, bit_2, shifted);
    input [15:0] data_in;
    input [3:0] bit_1;
    input [3:0] bit_2;
    output [15:0] shifted;

    assign shifted = ((bit_1 != 4'd0) ? (data_in >> bit_1) : 15'd0) + ((bit_2 != 4'd0) ? (data_in >> bit_2) : 15'd0);
endmodule