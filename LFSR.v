module linear_feedback_shift_register(out, clock, reset, seed, load_seed);
	output out;
	input [31:0] seed;
	input load_seed;
	input reset;
	input clock;
	wire [31:0] flip_flop_outputs;
	wire [31:0] flip_flop_inputs;
	wire feedback1, feedback2, feedback3;
	flip_flop flip_flop_instance[31:0] (flip_flop_outputs, clock, reset, flip_flop_inputs);
	one_bit_mux muxes[31:0] (flip_flop_inputs, load_seed, seed, {flip_flop_outputs[30:0], feedback3});
	xor feedback_gate_one(feedback1, flip_flop_outputs[6], flip_flop_outputs[31]);
	xor feedback_gate_two(feedback2, feedback1, flip_flop_outputs[5]);
	xor feedback_gate_three(feedback3, feedback2, flip_flop_outputs[1]);
	assign out = feedback3;
endmodule

module flip_flop(out, clock, reset, in);
	input clock;
	input reset;
	input in;
	output out;
	reg out;
	always @(posedge clock or posedge reset)
	begin

	if (reset)
		out = 0;
	else
		out = in;
	end
endmodule

module one_bit_mux(out, control, input_a, input_b);
	output out;
	reg out;
	input control, input_a, input_b;
	wire not_control;
	always @(control or not_control or input_a or input_b)
		out = (control & input_a) | (not_control & input_b);
		not (not_control, control);
endmodule
