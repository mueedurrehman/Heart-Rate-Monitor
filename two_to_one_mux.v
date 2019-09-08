module two_to_one_mux (INA,INB,OUT,SEL);
 input [7:0] INA;
 input [7:0] INB;
 input SEL;
 
 output [7:0] OUT;
 
 assign OUT = SEL ? INB : INA;

endmodule