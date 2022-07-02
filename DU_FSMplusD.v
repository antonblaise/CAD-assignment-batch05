// Author: Ha How Ung
// Written on: 26 June 2022 (Saturday)
// Title: FSM+D - Datapath Unit (DU) (Book 1 pg. 216)

module DU_FSMplusD (
	input clock, reset,
	input [3:0] a, b, c, d, e,
	input [1:0] sel1, sel2, sel3, 
	input ldR1, ldR2, ldR3,
	output reg [3:0] R1, R2, R3
);

	// clear registers
	always @ (posedge reset)
	begin
		R1 <= 4'h0;
		R2 <= 4'h0;
		R3 <= 4'h0;
	end
	
	// R1
	always @ (posedge clock)
	begin
		if (ldR1) begin
			case(sel1)
				0: R1 <= R1 * R3;
				1: R1 <= R1 + R3;
				2: R1 <= R1 + R2;
				3: R1 <= a;
			endcase
		end
		else
			R1 <= R1;
	end
	
	// R2
	always @ (posedge clock)
	begin
		if (ldR2) begin
			case(sel2)
				0: R2 <= R1 * R2;
				1: R2 <= R2 + R3;
				2: R2 <= c;
				3: R2 <= 4'bxxxx;
			endcase
		end
		else
			R2 <= R2;
	end
	
	// R3
	always @ (posedge clock)
	begin
		if (ldR3) begin
			case(sel3)
				0: R3 <= e;
				1: R3 <= d;
				2: R3 <= b;
				3: R3 <= 4'bxxxx;
			endcase
		end
		else
			R3 <= R3;
	end

endmodule