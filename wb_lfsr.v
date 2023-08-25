module wb_lfsr(i_clk, i_reset, i_wb_cyc, i_wb_stb, i_wb_we, i_wb_addr, i_wb_data, o_wb_stall, o_wb_data, o_wb_ack);
	input i_clk;
	input i_reset;
	input i_wb_cyc;
	input i_wb_stb;
	input i_wb_we;
	input [2:0] i_wb_addr;
	input[7:0] i_wb_data;

	output o_wb_stall;
	output reg o_wb_ack;
	output o_wb_data;

	reg [7:0] memory [0:5];
	wire [31:0] seed;
	wire lfsr_reset;
	wire load_seed;
	wire lfsr_out;
	integer i;

	linear_feedback_shift_register FLSR_instance(lfsr_out, i_clk, lfsr_reset, seed, load_seed);

	assign	o_wb_stall	=	1'b0;
	assign	o_wb_data	=	lfsr_out;
	assign	lfsr_reset	=	memory[4][0];
	assign	load_seed	=	memory[4][1];
	assign	seed		=	{memory[0], memory[1], memory[2], memory[3]};

	always @(posedge i_clk)
	if ((i_wb_stb)&&(i_wb_we)&&(!o_wb_stall))
	begin
		case (i_wb_addr)
			3'b000 :	memory[i_wb_addr] <= i_wb_data;
			3'b001 :	memory[i_wb_addr] <= i_wb_data;
			3'b010 :	memory[i_wb_addr] <= i_wb_data;
			3'b011 :	memory[i_wb_addr] <= i_wb_data;
			3'b100 :	memory[i_wb_addr] <= i_wb_data;
			default:	memory[i_wb_addr] <= i_wb_data;
		endcase
	end

	initial	o_wb_ack = 1'b0;

	always @(posedge i_clk)
	if (i_reset) begin
		o_wb_ack <= 1'b0;
		for (i=0; i<=5	; i=i+1)
			memory[i] <= 0;
	end else
		o_wb_ack <= ((i_wb_stb) && (!o_wb_stall));

endmodule
