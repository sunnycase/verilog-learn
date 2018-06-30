module chinon100top(
	CLK50,
	RST);
	
input wire CLK50;
input wire RST;


    chinon100 u0 (
        .clk_clk       (CLK50),       //   clk.clk
        .reset_reset_n (RST)  // reset.reset_n
    );

endmodule
