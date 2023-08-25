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
	output reg o_wb_data;

	reg [31:0] seed;
    reg lfsr_reset;
	reg load_seed;
	wire lfsr_out;

	linear_feedback_shift_register FLSR_instance(lfsr_out, i_clk, lfsr_reset, seed, load_seed);

	assign	o_wb_stall = 1'b0;

	always @(posedge i_clk)
	if ((i_wb_stb)&&(i_wb_we)&&(!o_wb_stall)&&(i_wb_cyc))
	begin
		case (i_wb_addr)
			3'b000 :	seed[7:0] <= i_wb_data;
			3'b001 :	seed[15:8] <= i_wb_data;
			3'b010 :	seed[23:16] <= i_wb_data;
			3'b011 :	seed[31:24] <= i_wb_data;
			3'b100 :
			begin
			    lfsr_reset <= i_wb_data[0];
        		load_seed <= i_wb_data[1];
        	end
			default:	seed <= 0;
		endcase
	end

	always @(posedge i_clk)
	if ((i_wb_stb)&&(!i_wb_we)&&(!o_wb_stall)&&(i_wb_cyc))
	begin
        o_wb_data <= lfsr_out;
	end

	initial	o_wb_ack = 1'b0;

	always @(posedge i_clk)
	if (i_reset) begin
		o_wb_ack <= 1'b0;
	end else
		o_wb_ack <= ((i_wb_stb) && (!o_wb_stall));

endmodule
