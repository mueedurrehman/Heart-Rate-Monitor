module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW); 
  input         CLK; 
  input         RESET; 
  input         EN_L; 
  input  [15:0] Iin; 
  input  [7:0]  Din; 
   
  output [7:0]  PC; 
  output [7:0]  NextPC; 
  output [7:0]  DataA; 
  output [7:0]  DataB; 
  output [7:0]  DataC; 
  output [7:0]  DataD; 
  output        MW; 
  wire MB; 
  wire MD;
  wire LD;
  wire C;
  wire V;
  wire N;
  wire Z;
  wire [2:0] DR;
  wire [2:0] SA;
  wire [2:0] SB;
  wire [5:0] IMM;
  wire [2:0] FS;
  wire [7:0] SEXT;
  wire [7:0] MBmuxOUT;
  wire BS;
  wire OFF;
  wire HALT;
  reg [7:0] PC; 
  reg [7:0] NextPC; 
  wire H; 
  wire [7:0] whichPC; 

  
  signExtend SE (
  .IMM(IMM),
  .SEXT(SEXT)
  );
  
  two_to_one_mux MBmux (
  .INA(DataB),
  .INB(SEXT),
  .SEL(MB),
  .OUT(MBmuxOUT)
  );
  
  two_to_one_mux MDmux (
  .INA(DataD),
  .INB(Din),
  .SEL(MD),
  .OUT(DataC)  
  );
  
  
   
 decoder d1( 
 .INST(Iin),
 .DR(DR), 
 .SA(SA), 
 .SB(SB), 
 .IMM(IMM), 
 .MB(MB), 
 .FS(FS), 
 .MD(MD), 
 .LD(LD), 
 .MW(MW), 
 .BS(BS), 
 .OFF(OFF), 
 .HALT(HALT) 
 ); 
   
  // comment the two lines out below if you use a submodule to generate PC/NextPC 
  

   
  // ADD YOUR CODE BELOW THIS LINE 
 
  alu alu1( 
   
  .A(DataA), 
  .B(MBmuxOUT), 
  .OP(FS), 
  .Y(DataD), 
  .C(C), 
  .V(V), 
  .N(N), 
  .Z(Z) 
  ); 
   
  registerFile regfile(
  .RESET(RESET),
  .LD(LD),
  .CLK(CLK),
  .SA(SA),
  .SB(SB),
  .DR(DR),
  .DataA(DataA),
  .DataB(DataB),
  .D_in(DataC)
  );
  
halt_logic haltLogic (
	.CLK (CLK),
	.HALT (HALT), 
	.EN_L (EN_L),
	.H (H)
);
two_to_one_mux doHalt (
	.INA((PC + 2)), 
	.INB(PC), 
	.SEL(H),
	.OUT(whichPC)
);
  always @(*) 
  begin  
    if (RESET) 
        NextPC = 8'd0; 
    else 
        NextPC =whichPC;          
	 end 

	always @ (posedge CLK)
	begin
		PC<=NextPC;
	end
   
   
      
  // ADD YOUR CODE ABOVE THIS LINE 
 
endmodule