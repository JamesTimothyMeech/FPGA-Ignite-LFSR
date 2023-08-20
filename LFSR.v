module LFSR(out, clk, reset, seed, load_seed);
	input[31:1] seed;
	input reset;
	input clk;
	input load_seed;
	output out;
	wire or_out_1;
	wire or_out_2;
	wire or_out_3;
	wire[31:0] flip_flop_outputs;
	wire[31:0] flip_flop_inputs;
	flip_flop flip_flop_instance[31:0] (flip_flop_inputs, clk, reset, flip_flop_outputs);
	one_bit_mux mux[31:1] (flip_flop_inputs[31:1], load_seed, seed, flip_flop_outputs[31:1]);
	assign or_out_1 = flip_flop_outputs[31] ^ flip_flop_outputs[21];
	assign or_out_2 = flip_flop_outputs[1] ^ or_out_1;
	assign or_out_3 = flip_flop_outputs[0] ^ or_out_2;
	assign flip_flop_inputs[0] = or_out_3;
	assign out = flip_flop_outputs[31];
endmodule

module flip_flop(flip_flop_input, clk, reset, flip_flop_output);
	input flip_flop_input;
	input clk;
	input reset;
	output reg flip_flop_output;
	always @(posedge clk)
	begin
		if (reset == 1'b1)
			flip_flop_output <= 1'b0;
		else
			flip_flop_output <= flip_flop_input;
	end
endmodule

module one_bit_mux (mux_output, mux_control, mux_input_a, mux_input_b);
	output mux_output;
	input mux_control;
	input mux_input_a;
	input mux_input_b;
	reg mux_output;
	wire mux_control_not;
	assign mux_control_not = !mux_control;
	always @(mux_control | mux_control_not | mux_input_a | mux_input_b)
		mux_output = (mux_control & mux_input_a) | (mux_control_not & mux_input_b);
endmodule
