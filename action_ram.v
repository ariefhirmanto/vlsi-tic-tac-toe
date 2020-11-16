// File     : action_ram.v
// Brief    : modul for memory management

module action_ram(clock, write_enable, write_address, d_in, read_address, d_out);
    input write_enable, clock;
    input [15:0] read_address, write_address;
    input [15:0] d_in;
    output reg [15:0] d_out;
    // model memory
    reg [15:0] memory_data [0:255];
    integer i;

    initial begin
        // read memory from file
        $readmemh("mem_in.list", memory_data);
    end

    always @(posedge clock) begin
        if(write_enable == 1) begin
            memory_data[write_address] = d_in;
            // write memory to file
            $writememh("memory_out.list", memory_data, 16'd0, 16'd19583);
        end
        d_out = memory_data[read_address];

        // debugging
        $display("isi memory");
        for(i=0; i<9; i=i+1) begin
            $display("memory_data[%0d] = 0x%0h", i, memory_data[i]);
        end
    end
endmodule