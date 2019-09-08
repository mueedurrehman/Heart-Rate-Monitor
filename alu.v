 module alu(A, B, OP, Y, C, V, N, Z);
  input  [7:0]  A;
  input  [7:0]  B;
  input  [2:0]  OP;

  output [7:0]  Y;
  output        C;
  output        V;
  output        N;
  output        Z;



  // ADD YOUR CODE BELOW THIS LINE
  wire CISEL;
  wire BSEL;
  wire [1:0] OSEL;
  wire SHIFT_LA;
  wire SHIFT_LR;
  wire LOGICAL_OP;
  wire [7:0] YADD;
  wire [7:0] YSHIFT;
  wire [7:0] YLOGIC;
  reg CARRY;
  wire [7:0] temp;
  wire CSHIFT;
  wire CADD;
  wire VADD;
 
 //control implementation
control cont (
	.OP(OP),
	.CISEL(CISEL),
	.BSEL(BSEL),
	.OSEL(OSEL),
	.SHIFT_LA(SHIFT_LA),
	.SHIFT_LR(SHIFT_LR),
	.LOGICAL_OP(LOGICAL_OP)
	);
	
two_to_one_mux bSELECT(
	.INA(B),
	.INB(~B),
	.OUT(temp),
	.SEL(BSEL)
	);
	
//adder implementation
adder a1 (
  .A (A), 
  .B(temp), 
  .CI (CISEL), 
  .Y (YADD),
  .C (CADD), 
  .V (VADD)
  );
  



	shifter shift(
	.A(A),
	.LA(SHIFT_LA),
	.LR(SHIFT_LR),
	.Y(YSHIFT),
	.C(CSHIFT)
	);
	
	four_to_one_mux OUTSELECT(
		.INA(YADD),
		.INB(YSHIFT),
		.INC(YLOGIC),
		.IND(8'b0),
		.SEL(OSEL),
		.OUT(Y)
		);
		
	logical LOGIC(
		.A(A),
		.B(B),
		.OP(LOGICAL_OP),
		.Y(YLOGIC)
		);
	


	// Calculating Z and N, need to change to only assignment statements
	assign C = OSEL[1] ? 1'b0 : (OSEL[0] ? CSHIFT : CADD);
	assign Z = (Y == 8'd0) ? 1'b1 : 1'b0;
	assign N = (Y[7] == 1'b1) ? 1'b1 : 1'b0;
	assign V = (OSEL == 2'b00) ? VADD : 1'b0;
		
endmodule