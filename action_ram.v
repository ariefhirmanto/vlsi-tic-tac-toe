// File     : action_ram.v
// Brief    : modul for memory management

module action_ram(clock, write_enable, write_address, d_in, read_address, d_out);
    input write_enable, clock;
    input [17:0] read_address, write_address;
    input [7:0] d_in;
    output reg [7:0] d_out;
    // model memory
    reg [17:0] memory_data [0:255];
    integer i;

    initial begin
        // read memory from file
        $readmemh("mem_in.list", memory_data);
    end

    always @(posedge clock) begin
        if(write_enable == 1) begin
            memory_data[write_address] = d_in;
            // write memory to file
            $writememh("mem_out.list", memory_data, 17'd0, 17'd262144);
        end
        d_out = memory_data[read_address];

        // debugging
        $display("isi memory");
        for(i=0; i<9; i=i+1) begin
            $display("memory_data[%0d] = 0x%0h", i, memory_data[i]);
        end
    end
endmodule