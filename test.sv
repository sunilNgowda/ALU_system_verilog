`include "definitions.pkg"
module test;
  instruction_t test_word;
  logic [31:0]result;
  logic clock = 0;
  ALU dut(.IW(test_word), .clock(clock), .result(result));
  
  always #10 clock = ~clock;
  
  initial begin
    @(negedge clock)
	  test_word.a = 5;
	  test_word.b = 7;
	  test_word.opcode = ADD;
	@(negedge clock)
	  $dumpfile("alu.vcd");
	  $dumpvars;
	  $display("result = %d,expected(12)",result);
	  $finish;
  end
endmodule
    