// Author: Ha How Ung
// Written on: 26 June 2022 (Saturday)
// Title: testbench - FSM+D - top (Book 1 pg. 216)

module top_FSMplusD_tb ();

  reg clock, reset;
  reg [3:0] a, b, c, d, e;
  wire [3:0] R1, R2, R3, PS, NS;

  top_FSMplusD DUT (
    .clock(clock), .reset(reset),
    .a(a), .b(b), .c(c), .d(d), .e(e),
    .R1(R1), .R2(R2), .R3(R3), .PS(PS), .NS(NS)
  );

  initial
    begin
      $monitor($time, " R1=%d, R2=%d, R3=%d, PS=%d, NS=%d", R1, R2, R3, PS, NS);
    end

  initial
    begin
      $dumpfile("top_FSMplusD.vcd");
      $dumpvars(1, top_FSMplusD_tb);

      #0 clock=0; reset=1; a=1; b=2; c=3; d=4; e=5;

      repeat(100) begin
        #50 clock = ~clock; reset=0;
      end

    end

endmodule
