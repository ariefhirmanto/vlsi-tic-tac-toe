module controlunit(enable, clock, action, en_policygen, outcome);
    input enable;
    input clock;
    input [3:0] action;
    output reg en_policygen;
    // 01 agent, 10 player
    output reg [1:0] outcome;
    reg [17:0] tTable;
    reg [15:0] counter;

    always @(posedge clock)
    begin
        if (!enable)
        begin
            counter <= 16'd0;
        end
        else
        begin
            counter <= counter + 16'd1;
        end
    end

    always @(posedge clock)
    begin
        if (!enable)
        begin
            tTable <= 18'd0;
        end
        else
        begin
            if (counter != 16'd0)
            begin
                en_policygen <= 1'd1;
                // learning agent won
                if((tTable[1:0] == 2'd1 && tTable[9:8] == 2'd1 && tTable[17:16] == 2'd1) || 
                (tTable[5:4] == 2'd1 && tTable[9:8] == 2'd1 && tTable[13:12] == 2'd1) || 
                    (tTable[1:0] == 2'd1 && tTable[3:2] == 2'd1 && tTable[5:4] == 2'd1) || 
                        (tTable[7:6] == 2'd1 && tTable[9:8] == 2'd1 && tTable[11:10] == 2'd1) || 
                            (tTable[13:12] == 2'd1 && tTable[15:14] == 2'd1 && tTable[17:16] == 2'd1) || 
                                (tTable[1:0] == 2'd1 && tTable[7:6] == 2'd1 && tTable[13:12] == 2'd1) || 
                                    (tTable[3:2] == 2'd1 && tTable[9:8] == 2'd1 && tTable[15:14] == 2'd1) || 
                                        (tTable[5:4] == 2'd1 && tTable[11:10] == 2'd1 && tTable[17:16] == 2'd1))
                    begin
                        tTable <= 18'd0;
                        outcome <= 01;
                    end
                // learning agent lose
                else if((tTable[1:0] == 2'd2 && tTable[9:8] == 2'd2 && tTable[17:16] == 2'd2) || 
                    (tTable[5:4] == 2'd2 && tTable[9:8] == 2'd2 && tTable[13:12] == 2'd2) || 
                        (tTable[1:0] == 2'd2 && tTable[3:2] == 2'd2 && tTable[5:4] == 2'd2) || 
                            (tTable[7:6] == 2'd2 && tTable[9:8] == 2'd2 && tTable[11:10] == 2'd2) || 
                                (tTable[13:12] == 2'd2 && tTable[15:14] == 2'd2 && tTable[17:16] == 2'd2) || 
                                    (tTable[1:0] == 2'd2 && tTable[7:6] == 2'd2 && tTable[13:12] == 2'd2) || 
                                        (tTable[3:2] == 2'd2 && tTable[9:8] == 2'd2 && tTable[15:14] == 2'd2) || 
                                            (tTable[5:4] == 2'd2 && tTable[11:10] == 2'd2 && tTable[17:16] == 2'd2))
                    begin
                        tTable <= 18'd0;
                        outcome <= 10;
                    end
                // match draw
                else if (!((tTable[1:0] == 2'd0) || (tTable[3:2] == 2'd0) || (tTable[5:4] == 2'd0) ||
                            (tTable[7:6] == 2'd0) || (tTable[9:8] == 2'd0) || (tTable[11:10] == 2'd0) ||
                            (tTable[13:12] == 2'd0) || (tTable[15:14] == 2'd0) || (tTable[17:16] == 2'd0))) 
                    begin
                        tTable <= 18'd0;
                        outcome <= 11;
                    end
                // continue
                else
                    begin
                        outcome <= 00;
                        case (action)
                            action == 4'd0: tTable[1:0] <= 01;
                            action == 4'd1: tTable[3:2] <= 01;
                            action == 4'd2: tTable[5:4] <= 01;
                            action == 4'd3: tTable[7:6] <= 01;
                            action == 4'd4: tTable[9:8] <= 01;
                            action == 4'd5: tTable[11:10] <= 01;
                            action == 4'd6: tTable[13:12] <= 01;
                            action == 4'd7: tTable[15:14] <= 01;
                            action == 4'd8: tTable[17:16] <= 01;
                        endcase
                    end 
            end
            else if (counter == 16'd100)
            begin
                en_policygen <= 1'd0;
                tTable <= 18'd0;
            end
        end
    end
endmodule