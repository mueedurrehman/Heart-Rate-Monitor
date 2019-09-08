module halt_logic(CLK, HALT,EN_L,H);

input CLK; 
input HALT;
input EN_L;
output reg H;


reg OLD_EN_L; 

always@(*)
begin
if (HALT)
	begin
		if (EN_L == 1'b0 && OLD_EN_L == 1'b1)
			begin
			H <= 1'b0; 
			end
		else
		begin
		H <= 1'b1; 
		end
	end
	else
	begin
	H <= 1'b0; 
	end
end
always @(posedge CLK)
begin
OLD_EN_L <= EN_L; 
end









endmodule