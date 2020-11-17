module max_Q(input_1,input_2,input_3,input_4,input_5,input_6,input_7,input_8,input_9,keluaran);
	input [7:0] input_1;
	input [7:0] input_2;
	input [7:0] input_3;
	input [7:0] input_4;
	input [7:0] input_5;
	input [7:0] input_6;
	input [7:0] input_7;
	input [7:0] input_8;
	input [7:0] input_9;

	wire [7:0] output_a;
	wire [7:0] output_b;
	wire [7:0] output_c;
	wire [7:0] output_d;
	wire [7:0] output_e;
	wire [7:0] output_f;
	wire [7:0] output_g;
	output [7:0] keluaran;

	max_modul inst_8(.in_1(input_9),.in_2(output_g),.out(keluaran));
	max_modul inst_7(.in_1(output_e),.in_2(output_f),.out(output_g));
	max_modul inst_6(.in_1(output_c),.in_2(output_d),.out(output_f));
	max_modul inst_5(.in_1(output_a),.in_2(output_b),.out(output_e));
	max_modul inst_4(.in_1(input_7),.in_2(input_8),.out(output_d));
	max_modul inst_3(.in_1(input_5),.in_2(input_6),.out(output_c));
	max_modul inst_2(.in_1(input_3),.in_2(input_4),.out(output_b));
	max_modul inst_1(.in_1(input_1),.in_2(input_2),.out(output_a));

endmodule	

module max_modul (in_1,in_2,out);
	input [7:0] in_1;
	input [7:0] in_2;
	output [7:0] out;
	assign out = (in_1>in_2) ? in_1 : in_2;
endmodule


