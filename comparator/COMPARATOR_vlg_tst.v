`timescale 10 ps/ 1 ps
module COMPARATOR_vlg_tst();
reg clk;
wire rco;
reg enable;
reg reset;
wire [3:0] A0_A3;
wire [3:0] B0_B3;
wire A_1;
wire B_1;
wire C_1;
wire A_2;
wire B_2;
wire C_2;
wire RUN = (~(|({A_1, B_1, C_1} ^ {A_2, B_2, C_2}))) && clk;

COMPARATOR i1_1 (
	.A(A_1),
	.B(B_1),
	.C(C_1),
	.A0_A3(A0_A3),
	.B0_B3(B0_B3),
	.enable(enable),
	.reset(reset)
);
COMPARATOR i1_2 (
	.A(A_2),
	.B(B_2),
	.C(C_2),
	.A0_A3(A0_A3),
	.B0_B3(B0_B3),
	.enable(enable),
	.reset(reset)
);
counter4 i2( 
	.clk(RUN),
	.enable(enable), 
	.reset(reset), 
	.number(A0_A3), 
	.carryBit(rco)
 );

counter4 i3(
	.clk(~rco), 
	.enable(enable), 
	.reset(reset), 
	.number(B0_B3), 
	.carryBit() 
);

initial begin
	clk <= 0;
	enable <= 1;
	reset <= 1;
	#1000 $stop;
	$display("Running testbench");
end

always begin
	#5 clk <= !clk;
end
initial begin
	#2 reset <= 0;
end
endmodule
module counter4(
	input clk,
	input enable,
	input reset,
	output reg [3:0] number,
	output reg carryBit
);	
	always @(posedge clk or posedge reset) begin
		if (reset == 1'b1)
			{carryBit, number} <= 5'b00000;
		else if (enable == 1'b1)
			{carryBit, number} <= number + 4'b0001;
	end
endmodule
