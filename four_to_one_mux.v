module four_to_one_mux (INA,INB,INC,IND,SEL,OUT);
input [7:0] INA;
input [7:0] INB;
input [7:0] INC;
input [7:0] IND;
input [1:0] SEL;

output [7:0] OUT;

//always @ (*)
//begin
	//if (SEL==2'b00)
	


	assign OUT = SEL[1] ? (SEL[0] ? IND : INC) : (SEL[0] ? INB : INA);

endmodule