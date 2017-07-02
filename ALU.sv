`include "definitions.pkg"

module ALU
          (input instruction_t IW,
           input logic clock,
	       output logic [31:0] result);
		   
  always_comb  begin   
    case(IW.opcode)
      definitions::ADD : result=IW.a + IW.b;
      definitions::SUB : result=IW.a - IW.b;
	  definitions::MUL : result=multiplier(IW.a,IW.b);
	endcase
  end
endmodule