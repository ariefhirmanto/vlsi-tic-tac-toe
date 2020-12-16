module stateIndex(
    table11,
    table12,
    table13,
    table21,
    table22,
    table23,
    table31,
    table32,
    table33,
    state
);
    input [1:0] table11;
    input [1:0] table12;
    input [1:0] table13;
    input [1:0] table21;
    input [1:0] table22;
    input [1:0] table23;
    input [1:0] table31;
    input [1:0] table32;
    input [1:0] table33;
    output [17:0] state;

    assign state[1:0] = table11;
    assign state[3:2] = table12;
    assign state[5:4] = table13;
    assign state[7:6] = table21;
    assign state[9:8] = table22;
    assign state[11:10] = table23;
    assign state[13:12] = table31;
    assign state[15:14] = table32;
    assign state[17:16] = table33;

endmodule
