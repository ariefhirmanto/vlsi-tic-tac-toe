module max_Q_18bit(input_1,input_2,input_3,input_4,input_5,input_6,input_7,input_8,input_9,keluaran);
	input [17:0] input_1;
	input [17:0] input_2;
	input [17:0] input_3;
	input [17:0] input_4;
	input [17:0] input_5;
	input [17:0] input_6;
	input [17:0] input_7;
	input [17:0] input_8;
	input [17:0] input_9;

	wire [17:0] output_a;
	wire [17:0] output_b;
	wire [17:0] output_c;
	wire [17:0] output_d;
	wire [17:0] output_e;
	wire [17:0] output_f;
	wire [17:0] output_g;
	output [17:0] keluaran;

	max_modul_18bit inst_8(.in_1(input_9),.in_2(output_g),.out(keluaran));
	max_modul_18bit inst_7(.in_1(output_e),.in_2(output_f),.out(output_g));
	max_modul_18bit inst_6(.in_1(output_c),.in_2(output_d),.out(output_f));
	max_modul_18bit inst_5(.in_1(output_a),.in_2(output_b),.out(output_e));
	max_modul_18bit inst_4(.in_1(input_7),.in_2(input_8),.out(output_d));
	max_modul_18bit inst_3(.in_1(input_5),.in_2(input_6),.out(output_c));
	max_modul_18bit inst_2(.in_1(input_3),.in_2(input_4),.out(output_b));
	max_modul_18bit inst_1(.in_1(input_1),.in_2(input_2),.out(output_a));

endmodule	

module max_modul_18bit (in_1,in_2,out);
	input [17:0] in_1;
	input [17:0] in_2;
	output [17:0] out;
	assign out = (in_1>in_2) ? in_1 : in_2;
endmodule


