module adder(A, B, CI, Y, C, V); // add all inputs and outputs inside parentheses
 
 
  // inputs
  input [7:0] A;
  input [7:0] B;
  input CI;
  
  // outputs
  output reg [7:0] Y;
  output reg C;
  output reg V;
 
  reg CARRY;

  
  always @ (*)
  begin
		Y[0]=((A[0]^B[0])^CI);
		CARRY=(A[0]&B[0]) | (A[0]&CI) | (B[0]&CI);
		Y[1]=((A[1]^B[1])^CARRY);
		CARRY=(A[1]&B[1]) | (A[1]&CARRY) | (B[1]&CARRY);
		Y[2]=((A[2]^B[2])^CARRY);
		CARRY=(A[2]&B[2]) | (A[2]&CARRY) | (B[2]&CARRY);
		Y[3]=((A[3]^B[3])^CARRY);
		CARRY=(A[3]&B[3]) | (A[3]&CARRY) | (B[3]&CARRY);
		Y[4]=((A[4]^B[4])^CARRY);
		CARRY=(A[4]&B[4]) | (A[4]&CARRY) | (B[4]&CARRY);
		Y[5]=((A[5]^B[5])^CARRY);
		CARRY=(A[5]&B[5]) | (A[5]&CARRY) | (B[5]&CARRY);
		Y[6]=((A[6]^B[6])^CARRY);
		CARRY=(A[6]&B[6]) | (A[6]&CARRY) | (B[6]&CARRY);
		Y[7]=((A[7]^B[7])^CARRY);
		C=(A[7]&B[7]) | (A[7]&CARRY) | (B[7]&CARRY);
		if ((A[7] == B[7]) && (Y[7] != A[7]))
			V = 1; 
		else 
			V = 0; 
	end
	
endmodule
	
			
			
      