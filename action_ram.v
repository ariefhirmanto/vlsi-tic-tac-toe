module action_ram(clock, read_address, d_in, write_address, write_enable, d_out);
    input write_enable, clock;
    input [7:0] read_address, write_address;
    input [15:0] d_in;
    output reg [15:0] d_out;

    reg [15:0] memory_data [0:255];

    initial begin
        $readmemh("mem_in.list", memory_data);
    end

    always @(posedge clock) begin
        if(write_enable == 1) begin
            memory_data[write_address] = d_in;
        end
        else begin
            d_out = memory_data[read_address];
        end
    end
endmodule