module COMPARATOR(
	input enable,
	input reset,
	input [3:0] A0_A3,
	input [3:0] B0_B3,
	output reg A, //если первое число больше
	output reg B, //числа равны
	output reg C,  //второе число больше
	output reg [1:0]state
);

localparam ENABLE = 2'b00;
localparam PAUSE = 2'b01;
localparam RESET = 2'b10;

always @(*) begin
	if(reset)
		{A, B, C} <= 3'b000;
	else if (enable) begin
		if(A0_A3 > B0_B3) {A, B, C} <= 3'b100;
		else if(A0_A3 == B0_B3) {A, B, C} <= 3'b010;
		else if(A0_A3 < B0_B3) {A, B, C} <= 3'b001;
	end
end

always @(*) begin

	case(state)
	ENABLE:
		if(reset) state <= RESET;
		else if (enable) state <= ENABLE;
		else state <= PAUSE;
	PAUSE:
		if(reset) state <= RESET;
		else if (enable) state <= ENABLE;
		else state <= PAUSE;
	RESET:
		if(reset) state <= RESET;
		else if (enable) state <= ENABLE;
		else state <= PAUSE;
	default:
		if(reset) state <= RESET;
		else if (enable) state <= ENABLE;
		else state <= PAUSE;
	endcase
end
	
endmodule