module barrelshifter(data_in, bit_1, bit_2, shifted);
    input [15:0] data_in;
    input [3:0] bit_1;
    input [3:0] bit_2;
    output [15:0] shifted;

    assign shifted = (data_in >> bit_1) + (data_in >> bit_2);
endmodule