module action_ram_tb ();
    reg clock, write_en;
    reg [7:0] read_address, write_address;
    reg [15:0] d_in;
    wire [15:0] d_out;

    action_ram action_ram1(.clock(clock), .read_address(read_address), 
        .d_in(d_in), .write_address(write_address), 
        .write_enable(write_enable), .d_out(d_out));
    
    initial
    begin
        write_en = 0;
        clock = 1'd0;
        #200
        read_address = 8'h00;
        #200
        read_address = read_address + 8'h01;
        #200
        read_address = read_address + 8'h01;
        #200
        read_address = read_address + 8'h01;
        #200
        write_en = 1;
        write_address = 8'h20;
        d_in = 8'd2;
        #200
        write_address = write_address + 8'h01;
        d_in = d_in + 8'd1;
        #200
        write_address = write_address + 8'h01;
        d_in = d_in + 8'd1;
        #200
        write_address = write_address + 8'h01;
        d_in = d_in + 8'd1;
        #200
        write_address = write_address + 8'h01;
        d_in = d_in + 8'd1;
        #200
        write_address = write_address + 8'h01;
        d_in = d_in + 8'd1;
    end

    always
    #100 clock = !clock;

    initial
    begin
    $monitor(" time = %2d, data out = %8d, data in= %8d", $time , d_out, d_in);
    end

endmodule
