
module wb_lfrs_test_harness;
	reg i_clk = 0;
	reg i_reset = 1;
	reg i_wb_cyc = 0;
	reg i_wb_stb = 0;
	reg i_wb_we = 0; 
	reg [2:0] i_wb_addr = 0;
	reg [7:0] i_wb_data = 0;

	wire o_wb_stall;	
	wire o_wb_data;
	wire o_wb_ack;

	wb_lfsr test_wb_lfsr(i_clk, i_reset, i_wb_cyc, i_wb_stb, i_wb_we, i_wb_addr, i_wb_data, o_wb_stall, o_wb_data, o_wb_ack);

	always
		#5 i_clk <= !i_clk;
	initial begin
		// reset lfsr
		$dumpfile("wave_wb.vcd");
		$dumpvars;
		i_clk <= 0;
		i_reset <= 1;
		i_wb_cyc <= 0;
		i_wb_stb <= 0;
		#10 i_reset = 0;
		@ (posedge i_clk);
			i_wb_cyc <= 1;
			i_wb_stb <= 1;
			i_wb_we <= 1;
			i_wb_addr <= 3'b100;
			i_wb_data <= 8'b00000001;
		wait (o_wb_ack == 1'b0);
		@ (posedge i_clk);
		i_wb_cyc <= 1'b0;
		i_wb_stb <= 1'b0;
		i_wb_we <= 1'b0;
		// load seed into mem byte 0
		@ (posedge i_clk);
			i_wb_cyc <= 1'b1;
			i_wb_stb <= 1'b1;
			i_wb_we <= 1'b1;
			i_wb_addr <= 3'b000;
			i_wb_data <= 8'b00010101;
		wait (o_wb_ack == 1'b0);
		@ (posedge i_clk);
			i_wb_cyc <= 1'b0;
			i_wb_stb <= 1'b0;
			i_wb_we <= 1'b0;
		// load seed into mem byte 1
		@ (posedge i_clk);
			i_wb_cyc <= 1'b1;
			i_wb_stb <= 1'b1;
			i_wb_we <= 1'b1;
			i_wb_addr <= 3'b001;
			i_wb_data <= 8'b00001111;
		wait (o_wb_ack == 1'b0);
		@ (posedge i_clk);
			i_wb_cyc <= 1'b0;
			i_wb_stb <= 1'b0;
			i_wb_we <= 1'b0;
		// load seed into mem byte 2
		@ (posedge i_clk);
			i_wb_cyc <= 1'b1;
			i_wb_stb <= 1'b1;
			i_wb_we <= 1'b1;
			i_wb_addr <= 3'b010;
			i_wb_data <= 8'b00100100;
		wait (o_wb_ack == 1'b0);
		@ (posedge i_clk);
			i_wb_cyc <= 1'b0;
			i_wb_stb <= 1'b0;
			i_wb_we <= 1'b0;
		// load seed into mem byte 3
		@ (posedge i_clk);
			i_wb_cyc <= 1'b1;
			i_wb_stb <= 1'b1;
			i_wb_we <= 1'b1;
			i_wb_addr <= 3'b011;
			i_wb_data <= 8'b01100100;
		wait (o_wb_ack == 1'b0);
		@ (posedge i_clk);
			i_wb_cyc <= 1'b0;
			i_wb_stb <= 1'b0;
			i_wb_we <= 1'b0;
		// load seed into lfsr
		@ (posedge i_clk);
			i_wb_cyc <= 1'b1;
			i_wb_stb <= 1'b1;
			i_wb_we <= 1'b1;
			i_wb_addr <= 3'b100;
			i_wb_data <= 8'b00000010;
		wait (o_wb_ack == 1'b0);
		@ (posedge i_clk);
			i_wb_cyc <= 1'b0;
			i_wb_stb <= 1'b0;
			i_wb_we <= 1'b0;
		// load seed into lfsr and exit reset state
		@ (posedge i_clk);
			i_wb_cyc <= 1'b1;
			i_wb_stb <= 1'b1;
			i_wb_we <= 1'b1;
			i_wb_addr <= 3'b100;
			i_wb_data <= 8'b00000000;
		wait (o_wb_ack == 1'b0);
		@ (posedge i_clk);
			i_wb_cyc <= 1'b0;
			i_wb_stb <= 1'b0;
			i_wb_we <= 1'b0;
		@ (posedge i_clk);
			i_wb_cyc <= 1'b1;
			i_wb_stb <= 1'b1;
			i_wb_we <= 1'b0;
		#5000 finish
	end
		#5000  $finish;
	end
endmodule
