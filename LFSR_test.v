module linear_feedback_shift_register_test_harness;
	reg clock;
	reg rst;
	reg [31:0] seed;
	reg load;
	wire q;
	linear_feedback_shift_register test_linear_feedback_shift_register(q, clock, rst,seed, load);
	initial begin
		$dumpfile("wave.vcd");
		$dumpvars;
		clock = 0;
		load = 0;
		seed = 0;
		rst = 0;
		#10 rst = 1;
		#10 rst = 0;
	end

	always
		#50 clock = !clock;
	initial begin
		#100 seed = 32'b00010101000011110010010001100100;
		load = 1;
		#100 load = 0;
		#1000  $finish;
	end
endmodule
