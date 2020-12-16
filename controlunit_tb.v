module controlunit_tb();
    reg enable;
    reg clock;
    reg [3:0] action;
    wire en_policygen;
    // 01 agent, 10 player
    wire [1:0] outcome;

    controlunit cu (
        .enable(enable),
        .clock(clock),
        .en_policygen(en_policygen),
        .outcome(outcome)
    )

    initial begin
        clock = 1'd0;
        #100
        
        #100
        #100
        #100
        #100
        #100
    end

    always begin
        #100 clock = !clock;
    end
endmodule