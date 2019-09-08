module registerFile(RESET,CLK,SA,SB,DR,LD,DataA,DataB,D_in);	
	reg [7:0] REGISTER[0:7]; 
	input RESET;
	input CLK; 
	input [2:0] SA;
	input [2:0] SB; 
	input LD; 
	input [2:0] DR;
	input [7:0] D_in; 
	
	output [7:0] DataA; 
	output [7:0] DataB; 
	

	
	always @(posedge CLK)
	begin
		if (RESET)
		begin
			REGISTER[0]<=8'b0; 
			REGISTER[1]<=8'b0; 
			REGISTER[2]<=8'b0; 
			REGISTER[3]<=8'b0; 
			REGISTER[4]<=8'b0; 
			REGISTER[5]<=8'b0; 
			REGISTER[6]<=8'b0; 
			REGISTER[7]<=8'b0; 
		end 
		else if (LD)
		begin
		REGISTER[DR] <= D_in; 
		end
		else
		begin
		REGISTER[0]<=REGISTER[0]; 
		REGISTER[1]<=REGISTER[1]; 
		REGISTER[2]<=REGISTER[2]; 
		REGISTER[3]<=REGISTER[3]; 
		REGISTER[4]<=REGISTER[4]; 
		REGISTER[5]<=REGISTER[5]; 
		REGISTER[6]<=REGISTER[6]; 
		REGISTER[7]<=REGISTER[7];
		end
	end
	assign DataA = REGISTER[SA];
	assign DataB = REGISTER[SB];
	
endmodule 