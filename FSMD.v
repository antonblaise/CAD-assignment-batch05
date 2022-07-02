// Author: Ha How Ung
// Written on: 26 June 2022 (Saturday)
// Title: FSMD (Book 1 pg. 216)

module FSMD (
	input clock, reset,
	input [3:0] a, b, c, d, e,
	output reg [3:0] R1, R2, R3, PS, NS
);

	localparam	S0 = 3'b000,
					S1 = 3'b001,
					S2 = 3'b010,
					S3 = 3'b011,
					S4 = 3'b100;

	always @ (posedge clock, posedge reset)
	begin
		if (reset == 1'b1) begin
			R1 <= 0;
			R2 <= 0;
			R3 <= 0;
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
				R1 = a;
				R2 = c;
				NS = S1;
			end
			
			S1: begin
				R1 = R1 + R2;
				R3 = d;
				NS = S2;
			end
			
			S2: begin
				R2 = R2 + R3;
				R3 = b;
				NS = S3;
			end
			
			S3: begin
				R1 = R1 + R3;
				R2 = R1 * R2;
				R3 = e;
				NS = S4;
			end
			
			S4: begin
				R1 = R1 * R3;
				NS = S0;
			end
			
			default: NS = S0;
		endcase
	end

endmodule