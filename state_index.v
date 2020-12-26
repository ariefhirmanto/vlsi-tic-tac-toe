module state_index(en_switch_action, enable, action, state);
    input enable;
    input en_switch_action;
    input [3:0] action;
    reg [17:0] stateTable;
    input [17:0] state;
    always @(enable)
    begin
        if (enable)
        begin
           if (en_switch_action)
           begin
                case (action)
                    action == 4'd0: stateTable[1:0] <= 01;
                    action == 4'd1: stateTable[3:2] <= 01;
                    action == 4'd2: stateTable[5:4] <= 01;
                    action == 4'd3: stateTable[7:6] <= 01;
                    action == 4'd4: stateTable[9:8] <= 01;
                    action == 4'd5: stateTable[11:10] <= 01;
                    action == 4'd6: stateTable[13:12] <= 01;
                    action == 4'd7: stateTable[15:14] <= 01;
                    action == 4'd8: stateTable[17:16] <= 01;   
                endcase 
           end
           else
           begin
               case (action)
                    action == 4'd0: stateTable[1:0] <= 10;
                    action == 4'd1: stateTable[3:2] <= 10;
                    action == 4'd2: stateTable[5:4] <= 10;
                    action == 4'd3: stateTable[7:6] <= 10;
                    action == 4'd4: stateTable[9:8] <= 10;
                    action == 4'd5: stateTable[11:10] <= 10;
                    action == 4'd6: stateTable[13:12] <= 10;
                    action == 4'd7: stateTable[15:14] <= 10;
                    action == 4'd8: stateTable[17:16] <= 10;   
                endcase 
           end
        end
        else
        begin
            stateTable <= 18'd0;
        end
    end
    assign state = stateTable;
endmodule
 