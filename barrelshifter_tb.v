module barrelshifter_tb;
  reg [15:0] in;
  reg [3:0] bit_1;
  reg [3:0] bit_2;
  wire [15:0] out; 
  
barrelshifter uut(.data_in(in), .bit_1(bit_1), .bit_2(bit_2), .shifted(out));
  
initial 
 begin
    $display($time, " << Starting the Simulation >>");
    in= 16'd0;  bit_1=4'd0; bit_2=4'd0; //no shift
    #10 in=16'd128; bit_1= 4'd2; bit_2=4'd0; //multiply by 1/4
    #10 in=16'd9; bit_1= 4'd1; bit_2=4'd3; //multiply by 0,625
    #10 in=16'd128; bit_1= 4'd1; bit_2=4'd0; 
  end
endmodule