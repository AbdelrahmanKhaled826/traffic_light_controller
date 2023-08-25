`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:28 08/25/2023 
// Design Name: 
// Module Name:    traffic_light_controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module traffic_light_controller( 
input clk,reset,
output reg green_a,green_b,
output reg red_a,red_b,
output reg yellow_a,yellow_b
    );

reg [2:0] next_state,current_state;
wire timer1,timer2,timer3;
//red a green b
//yellow a green b
//green a red b
//red a yellow b
 localparam off=0,
		s1=1,
		s2=2,
		s3=3,
		s4=4;

always @(posedge clk, posedge reset)
begin
	if(reset)
		current_state<=off;
	else 
		current_state<=next_state;
end

always @(*)
begin
	green_a=0;
	green_b=0;
	yellow_a=0;
	yellow_b=0;
	red_a=0;
	red_b=0;
	case(current_state)
	off: 	if(reset) 
		next_state=off;
		else 		
		next_state=s1;
		
	s1:     begin
		red_a=1;
	          green_b=1;
		green_a=0;
		yellow_a=0;
		yellow_b=0;
		red_b=0;
		if(timer1) begin
		next_state=s2;
		 end
		else begin
		next_state=s1;
		end
		end
	s2:  begin   	yellow_a=1;
		green_b=1;
		green_a=0;
		yellow_b=0;
		red_a=0;
		red_b=0;
		if(timer2)
		next_state=s3;
		else begin
		next_state=s2;
		end
		end
	s3:    begin red_b=1;
	          green_a=1;
		green_b=0;
		yellow_a=0;
		yellow_b=0;
		red_a=0;
		
		if(timer3)
		next_state=s4;
		else begin
		next_state=s3;
		
		
		end
		end
	s4:     	begin yellow_b=1;
		red_a=1;
		green_a=0;
		green_b=0;
		yellow_a=0;
		red_b=0;	
			
		if(timer2)
		next_state=s1;
		else begin
		next_state=s4;	
		
		end end
	default: next_state=off;
	endcase
end





//********************************
reg [5:0] count;
always @(posedge clk)
begin
if(reset | count==40) count<=0;
else  count<=count+1;
end

assign timer1=(count==40)?1'b1:1'b0;
assign timer2=(count==10)?1'b1:1'b0;
assign timer3=(count==30)?1'b1:1'b0;

endmodule
