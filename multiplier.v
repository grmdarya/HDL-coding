module multiplier(
	input clk1,
	output [3:0] num1,
	output [3:0] num2,
	output [7:0] result
);
	wire rco1;
	wire rco2;
	
	wire crBt_1;
	wire crBt_2;
	wire crBt_3;
	
	wire [3:0]resultAnd_1;
	wire [3:0]resultAnd_2;
	wire [3:0]resultAnd_3;
	wire [3:0]resultAnd_4;
	
	wire [3:0]inAddr_1;
	wire [3:0]inAddr_2;
	wire [3:0]inAddr_3;
	
	wire [3:0] resultSum_1;
	wire [3:0] resultSum_2;
	wire [3:0] resultSum_3;
	
	assign result[0] = resultAnd_1[0];
	assign result[1] = resultSum_1[0];
	assign result[2] = resultSum_2[0];
	assign result[6:3] = resultSum_3;
	assign result[7] = crBt_3;
	
	assign inAddr_1[2:0] = resultAnd_1[3:1];
	assign inAddr_1[3] = 1'b0;
	
	assign inAddr_2[2:0] = resultSum_1[3:1];
	assign inAddr_2[3] = crBt_1;
	
	assign inAddr_3[2:0] = resultSum_2[3:1];
	assign inAddr_3[3] = crBt_2;
	
	counter4 my_counter4_1(.clk(clk1), .number(num1), .carryBit(rco1));
	counter4 my_counter4_2(.clk(~rco1), .number(num2), .carryBit(rco2));

	and2 my_and2_1(.in1(num1[0]), .in2(num2[0]), .out(resultAnd_1[0]));
	and2 my_and2_2(.in1(num1[1]), .in2(num2[0]), .out(resultAnd_1[1]));
	and2 my_and2_3(.in1(num1[2]), .in2(num2[0]), .out(resultAnd_1[2]));
	and2 my_and2_4(.in1(num1[3]), .in2(num2[0]), .out(resultAnd_1[3]));
	
	and2 my_and2_5(.in1(num1[0]), .in2(num2[1]), .out(resultAnd_2[0]));
	and2 my_and2_6(.in1(num1[1]), .in2(num2[1]), .out(resultAnd_2[1]));
	and2 my_and2_7(.in1(num1[2]), .in2(num2[1]), .out(resultAnd_2[2]));
	and2 my_and2_8(.in1(num1[3]), .in2(num2[1]), .out(resultAnd_2[3]));
	
	and2 my_and2_9(.in1(num1[0]), .in2(num2[2]), .out(resultAnd_3[0]));
	and2 my_and2_10(.in1(num1[1]), .in2(num2[2]), .out(resultAnd_3[1]));
	and2 my_and2_11(.in1(num1[2]), .in2(num2[2]), .out(resultAnd_3[2]));
	and2 my_and2_12(.in1(num1[3]), .in2(num2[2]), .out(resultAnd_3[3]));
	
	and2 my_and2_13(.in1(num1[0]), .in2(num2[3]), .out(resultAnd_4[0]));
	and2 my_and2_14(.in1(num1[1]), .in2(num2[3]), .out(resultAnd_4[1]));
	and2 my_and2_15(.in1(num1[2]), .in2(num2[3]), .out(resultAnd_4[2]));
	and2 my_and2_16(.in1(num1[3]), .in2(num2[3]), .out(resultAnd_4[3]));
	
	adder4 my_adder4_1 (
		.argOne(inAddr_1),
		.argTwo(resultAnd_2),
		.result(resultSum_1),
		.carryBit(crBt_1)
	);
	adder4 my_adder4_2 (
		.argOne(resultAnd_3), 
		.argTwo(inAddr_2), 
		.result(resultSum_2), 
		.carryBit(crBt_2)
	);

	adder4 my_adder4_3 (
		.argOne(resultAnd_4), 
		.argTwo(inAddr_3), 
		.result(resultSum_3), 
		.carryBit(crBt_3)
	);
	
endmodule


module counter4(
	input clk,
	output reg [3:0] number,
	output reg carryBit
);
	always @(posedge clk) begin
		{carryBit, number} = number + 4'b0001;
	end
endmodule

module adder4(
	input [3:0] argOne,
	input [3:0] argTwo,
	output [3:0] result,
	output carryBit
);
	assign {carryBit, result} = argOne + argTwo;
endmodule

module and2(
	input in1,
	input in2,
	output out
);
	assign out = in1 & in2;
endmodule
