module decoder(INST, DR, SA, SB, IMM, MB, FS, MD, LD, MW, BS, OFF, HALT);
	input [15:0] INST;
	output reg [2:0] DR;
	output reg [2:0]SA;
	output reg [2:0] SB;
	output reg [5:0]IMM;
	output reg MB;
	output reg [2:0] FS;
	output reg MD;
	output reg LD;
	output reg MW;
	output reg BS;
	output reg OFF;
	output reg HALT;
	
	reg [2:0] RT;
	reg [2:0] RS;
	reg [2:0] RD;
	reg [3:0] OP;
	reg [2:0] FUNCT;
	
	

	

always @ (*)
	begin
	RT <= INST[8:6];
	RS <= INST[11:9];
	RD <= INST[5:3];
	IMM <= INST[5:0];
	OP <= INST[15:12];
	FUNCT<= INST[2:0];
	BS = 1'b0; 
	OFF = 1'b0; 
	HALT = 1'b0; 
	case (OP)
	4'd0: begin 
			case(FUNCT)
			3'd1:begin
			DR=3'd0;
			SA=3'd0;
			SB=3'd0; 
			MB=1'b0;
			FS=3'd0;
			MD=1'b0;
			LD=1'b0;
			MW=1'b0;
			HALT=1'b1;
			end
			default:begin
			DR=3'd0;
			SA=3'd0;
			SB=3'd0; 
			MB=1'b0;
			FS=3'd0;
			MD=1'b0;
			LD=1'b0;
			MW=1'b0;
			end
			endcase
			end

	4'b0010: begin 
			DR=RT;
			SA=RS;
			SB=3'd0; 
			MB=1'b1;
			FS=3'd0;
			MD=1'b1;
			LD=1'b1;
			MW=1'b0;
	end
	4'b0100: begin 
			DR=3'd0;
			SA=RS;
			SB=RT; 
			MB=1'b1;
			FS=3'd0;
			MD=1'b0;
			LD=1'b0;
			MW=1'b1;
	end
	4'b0101: begin
			DR=RT;
			SA=RS;
			SB=3'd0; 
			MB=1'b1;
			FS=3'd0;
			MD=1'b0;
			LD=1'b1;
			MW=1'b0;
	end
	4'b0110:
		begin
			DR=RT;
			SA=RS;
			SB=3'd0; 
			MB=1'b1;
			FS=3'b101;
			MD=1'b0;
			LD=1'b1;
			MW=1'b0;
		end
		4'b0111:
		begin
			DR=RT;
			SA=RS;
			SB=3'd0; 
			MB=1'b1;
			FS=3'b110;
			MD=1'b0;
			LD=1'b1;
			MW=1'b0;
		end
	4'b1111: begin 
		case (FUNCT) 
		3'b000:
			begin
				//ADD
				DR=RD;
				SA=RS;
				SB=RT; 
				MB=1'b0;
				FS=3'd0;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end
		   3'b001:
			begin
				//SUB
				DR=RD;
				SA=RS;
				SB=RT; 
				MB=1'b0;
				FS=3'b001;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end
			3'b010: begin
				//SRA
				DR=RD;
				SA=RS;
				SB=3'd0; 
				MB=1'b0;
				FS=3'b010;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end
			3'b011:
			begin
				//SRL
				DR=RD;
				SA=RS;
				SB=3'd0; 
				MB=1'b0;
				FS=3'b011;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end
			3'b100:
			begin
				//SLL
				DR=RD;
				SA=RS;
				SB=3'd0; 
				MB=1'b0;
				FS=3'b100;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end
			3'b101:
			begin
				//AND
				DR=RD;
				SA=RS;
				SB=RT;
				MB=1'b0;
				FS=3'b101;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end
				3'b110: 
					begin
				DR=RD;
				SA=RS;
				SB=RT; 
				MB=1'b0;
				FS=3'b110;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end		
			default: 
			begin  
			DR=3'd0;
			SA=3'd0;
			SB=3'd0; 
			MB=1'b0;
			FS=3'd0;
			MD=1'b0;
			LD=1'b0;
			MW=1'b0;
			end
		endcase
	end
	default: 
			begin  
			DR=3'd0;
			SA=3'd0;
			SB=3'd0; 
			MB=1'b0;
			FS=3'd0;
			MD=1'b0;
			LD=1'b0;
			MW=1'b0;
			end
	endcase
	end

	/*if (INST[15:12]==4'b0000)
		begin
			//NOP
			
		end
	else if (INST[15:12]==4'b0010)
		begin
			//LB
		end
	else if (INST[15:12]==4'b0100)
		begin
			//SB
			DR=3'd0;
			SA=INST[11:9];
			SB=INST[8:6]; 
			IMM=INST[5:0];
			MB=1'b1;
			FS=3'd0;
			MD=1'b0;
			LD=1'b0;
			MW=1'b1;
		end
	else if (INST[15:12]==4'b0101)
		begin
			//ADDI
			DR=INST[8:6];
			SA=INST[11:9];
			SB=3'd0; 
			IMM=INST[5:0];
			MB=1'b1;
			FS=3'd0;
			MD=1'b0;
			LD=1'b1;
			MW=1'b0;
		end
	else if (INST[15:12]==4'b0110)
		begin
			//ANDI
			DR=INST[8:6];
			SA=INST[11:9];
			SB=3'd0; 
			IMM=INST[5:0];
			MB=1'b1;
			FS=3'b101;
			MD=1'b0;
			LD=1'b1;
			MW=1'b0;
		end
	else if (INST[15:12]==4'b0111)
		begin
			//ORI
			DR=INST[8:6];
			SA=INST[11:9];
			SB=3'd0; 
			IMM=INST[5:0];
			MB=1'b1;
			FS=3'b110;
			MD=1'b0;
			LD=1'b1;
			MW=1'b0;
		end
	else if (INST[15:12]==4'b1111)//maybe make into an else
		begin
		if (INST[2:0]==3'b000)
			begin
				//ADD
				DR=INST[5:3];
				SA=INST[11:9];
				SB=INST[8:6]; 
				IMM=6'd0;
				MB=1'b0;
				FS=3'd0;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end
		else if (INST[2:0]==3'b001)
			begin
				//SUB
				DR=INST[5:3];
				SA=INST[11:9];
				SB=INST[8:6]; 
				IMM=6'd0;
				MB=1'b0;
				FS=3'b001;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end
		else if (INST[2:0]==3'b010)
			begin
				//SRA
				DR=INST[5:3];
				SA=INST[11:9];
				SB=3'd0; 
				IMM=6'd0;
				MB=1'b0;
				FS=3'b010;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end
		else if (INST[2:0]==3'b011)
			begin
				//SRL
				DR=INST[5:3];
				SA=INST[11:9];
				SB=3'd0; 
				IMM=6'd0;
				MB=1'b0;
				FS=3'b011;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end
		else if (INST[2:0]==3'b100)
			begin
				//SLL
				DR=INST[5:3];
				SA=INST[11:9];
				SB=3'd0; 
				IMM=6'd0;
				MB=1'b0;
				FS=3'b100;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end
		else if (INST[2:0]==3'b101)
			begin
				//AND
				DR=INST[5:3];
				SA=INST[11:9];
				SB=INST[8:6]; 
				IMM=6'd0;
				MB=1'b0;
				FS=3'b101;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end
		else
			begin
				//OR
				DR=INST[5:3];
				SA=INST[11:9];
				SB=INST[8:6]; 
				IMM=6'd0;
				MB=1'b0;
				FS=3'b110;
				MD=1'b0;
				LD=1'b1;
				MW=1'b0;
			end		
		end
	end*/
	

endmodule
