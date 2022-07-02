// Author: Ha How Ung
// Written on: 26 June 2022 (Saturday)
// Title: FSM+D - top (Book 1 pg. 216)

module top_FSMplusD (
	input clock, reset,
	input [3:0] a, b, c, d, e,
	output [3:0] R1, R2, R3, PS, NS
);

	wire [1:0] sel1, sel2, sel3;
	wire ldR1, ldR2, ldR3;
	
	CU_FSMplusD CU (
		.clock(clock), .reset(reset),
		.a(a), .b(b), .c(c), .d(d), .e(e),
		.PS(PS), .NS(NS),
		.sel1(sel1), .sel2(sel2), .sel3(sel3), 
		.ldR1(ldR1), .ldR2(ldR2), .ldR3(ldR3)
	);
	
	DU_FSMplusD DU (
		.clock(clock), .reset(reset),
		.a(a), .b(b), .c(c), .d(d), .e(e),
		.sel1(sel1), .sel2(sel2), .sel3(sel3), 
		.ldR1(ldR1), .ldR2(ldR2), .ldR3(ldR3),
		.R1(R1), .R2(R2), .R3(R3)
	);

endmodule