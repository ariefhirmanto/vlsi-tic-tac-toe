module decoder_tb();
    reg clock;
    reg [8:0] sel;
    wire en1;
    wire en2;
    wire en3;
    wire en4;
    wire en5;
    wire en6;
    wire en7;
    wire en8;
    wire en9;

    decoder decode(
        .sel(sel),
        .en1(en1),
        .en2(en2),
        .en3(en3),
        .en4(en4),
        .en5(en5),
        .en6(en6),
        .en7(en7),
        .en8(en8),
        .en9(en9)
    );

    initial
    begin
        clock = 1'd0;
        # 200 sel = 8'd0;
        # 200 sel = 8'd1;
        # 200 sel = 8'd2;
        # 200 sel = 8'd3;
        # 200 sel = 8'd4;
        # 200 sel = 8'd5;
        # 200 sel = 8'd6;
        # 200 sel = 8'd7;
        # 200 sel = 8'd8;       
    end 

    always @(*)
    begin
        # 100 clock = !clock;
    end
endmodule

