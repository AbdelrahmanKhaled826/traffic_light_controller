`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:57:55 08/25/2023
// Design Name:   traffic_light_controller
// Module Name:   C:/example_verilog/d_ff/traffic_tb.v
// Project Name:  d_ff
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_light_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module traffic_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire green_a;
	wire green_b;
	wire red_a;
	wire red_b;
	wire yellow_a;
	wire yellow_b;

	// Instantiate the Unit Under Test (UUT)
	traffic_light_controller uut (
		.clk(clk), 
		.reset(reset), 
		.green_a(green_a), 
		.green_b(green_b), 
		.red_a(red_a), 
		.red_b(red_b), 
		.yellow_a(yellow_a), 
		.yellow_b(yellow_b)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#100
		reset=0;
		
		#100000
		$stop;
	end
  always #5 clk=~clk;    
endmodule

