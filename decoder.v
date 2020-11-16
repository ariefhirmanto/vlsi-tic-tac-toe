module decoder(sel, en1, en2, en3, en4, en5, en6, en7, en8, en9);
    input [3:0] sel;
    output en1;
    output en2;
    output en3;
    output en4;
    output en5;
    output en6;
    output en7;
    output en8;
    output en9;
    reg en1;
    reg en2;
    reg en3;
    reg en4;
    reg en5;
    reg en6;
    reg en7;
    reg en8;
    reg en9;

    always @(sel)
    begin
        case(sel)
        4'd0: 
            begin
                en1 <= 1'd1;
                en2 <= 1'd0;
                en3 <= 1'd0;
                en4 <= 1'd0;
                en5 <= 1'd0;
                en6 <= 1'd0;
                en7 <= 1'd0;
                en8 <= 1'd0;
                en9 <= 1'd0;
            end
        4'd1: 
            begin
                en1 <= 1'd0;
                en2 <= 1'd1;
                en3 <= 1'd0;
                en4 <= 1'd0;
                en5 <= 1'd0;
                en6 <= 1'd0;
                en7 <= 1'd0;
                en8 <= 1'd0;
                en9 <= 1'd0;
            end
        4'd2: 
            begin
                en1 <= 1'd0;
                en2 <= 1'd0;
                en3 <= 1'd1;
                en4 <= 1'd0;
                en5 <= 1'd0;
                en6 <= 1'd0;
                en7 <= 1'd0;
                en8 <= 1'd0;
                en9 <= 1'd0;
            end
        4'd3: 
            begin
                en1 <= 1'd0;
                en2 <= 1'd0;
                en3 <= 1'd0;
                en4 <= 1'd1;
                en5 <= 1'd0;
                en6 <= 1'd0;
                en7 <= 1'd0;
                en8 <= 1'd0;
                en9 <= 1'd0;
            end
        4'd4: 
            begin
                en1 <= 1'd0;
                en2 <= 1'd0;
                en3 <= 1'd0;
                en4 <= 1'd0;
                en5 <= 1'd1;
                en6 <= 1'd0;
                en7 <= 1'd0;
                en8 <= 1'd0;
                en9 <= 1'd0;
            end
        4'd5: 
            begin
                en1 <= 1'd0;
                en2 <= 1'd0;
                en3 <= 1'd0;
                en4 <= 1'd0;
                en5 <= 1'd0;
                en6 <= 1'd1;
                en7 <= 1'd0;
                en8 <= 1'd0;
                en9 <= 1'd0;
            end
        4'd6: 
            begin
                en1 <= 1'd0;
                en2 <= 1'd0;
                en3 <= 1'd0;
                en4 <= 1'd0;
                en5 <= 1'd0;
                en6 <= 1'd0;
                en7 <= 1'd1;
                en8 <= 1'd0;
                en9 <= 1'd0;
            end
        4'd7: 
            begin
                en1 <= 1'd0;
                en2 <= 1'd0;
                en3 <= 1'd0;
                en4 <= 1'd0;
                en5 <= 1'd0;
                en6 <= 1'd0;
                en7 <= 1'd0;
                en8 <= 1'd1;
                en9 <= 1'd0;
            end
        4'd8: 
            begin
                en1 <= 1'd0;
                en2 <= 1'd0;
                en3 <= 1'd0;
                en4 <= 1'd0;
                en5 <= 1'd0;
                en6 <= 1'd0;
                en7 <= 1'd0;
                en8 <= 1'd0;
                en9 <= 1'd1;
            end
        endcase
    end
endmodule