// File     : action_ram_tb.v
// Brief    : test bench for action ram module

module action_ram_tb ();
    reg clock, write_enable;
    reg [17:0] read_address, write_address;
    reg [7:0] d_in;
    wire [7:0] d_out;

    action_ram uut (.clock(clock), .write_enable(write_enable), 
                    .write_address(write_address), .d_in(d_in), 
                    .read_address(read_address), .d_out(d_out)
    );
    
    initial begin
        clock = 1'd0;
        #100
        write_enable = 0;
        read_address = 17'd0;
        write_address = 17'd5;
        #200
        read_address = read_address + 17'd1;
        #200
        read_address = read_address + 17'd1;
        #200
        read_address = read_address + 17'd1;
        #200
        write_enable = 1;
        d_in = 8'd12;
        #200
        read_address = 17'd5;
        write_address = write_address + 17'd6;
        d_in = 8'd13;
    end

    always begin
        #100 clock = !clock;
        $display("time = %2d, data out = %8d, data in= %8d", $time , d_out, d_in); 
    end

endmodule
