// Author: Ha How Ung
// Written on: 26 June 2022 (Saturday)
// Title: FSM+D - Control Unit (CU) (Book 1 pg. 216)

module CU_FSMplusD (
	input clock, reset,
	input [3:0] a, b, c, d, e,
	output reg [3:0] PS, NS,
	output reg [1:0] sel1, sel2, sel3, 
	output reg ldR1, ldR2, ldR3
);

	localparam	S0 = 3'b000,
					S1 = 3'b001,
					S2 = 3'b010,
					S3 = 3'b011,
					S4 = 3'b100;

	always @ (posedge clock, posedge reset)
	begin
		if (reset == 1'b1) begin
			sel1 <= 0;
			sel2 <= 0;
			sel3 <= 0;
			ldR1 <= 0;
			ldR2 <= 0;
			ldR3 <= 0;
			PS <= S0;
		end
		else begin
			PS <= NS;
		end
	end
	
	always @ (*)
	begin
		NS = PS;
		
		case(PS)
		
			S0: begin
				sel1 = 2'b11; // R1 = a
				sel2 = 2'b10; // R2 = c
				ldR1 = 1'b1;
				ldR2 = 1'b1;
				NS = S1;
			end
			
			S1: begin
				sel1 = 2'b10; // R1 = R1 + R2
				sel3 = 2'b01; // R3 = d
				ldR1 = 1'b1;
				ldR3 = 1'b1;
				NS = S2;
			end
			
			S2: begin
				sel2 = 2'b01; // R2 = R2 + R3
				sel3 = 2'b10; // R3 = b
				ldR2 = 1'b1;
				ldR3 = 1'b1;
				NS = S3;
			end
			
			S3: begin
				sel1 = 2'b01; // R1 = R1 + R3
				sel2 = 2'b00; // R2 = R1 * R2
				sel3 = 2'b00; // R3 = e
				ldR1 = 1'b1;
				ldR2 = 1'b1;
				ldR3 = 1'b1;
				NS = S4;
			end
			
			S4: begin
				sel1 = 2'b00; // R1 = R1 * R3
				ldR1 = 1'b1;
				NS = S0;
			end
			
			default: NS = S0;
		endcase
	end

endmodule