
module mult4 (
	     input [3:0] A, B,
	     output [7:0] X
	     );
	wire [3:0] partial0;
	wire [3:0] partial1;
	wire [3:0] partial2;
	wire [3:0] partial3;

	assign partial0 = A & {4{B[0]}};
	assign partial1 = A & {4{B[1]}};
	assign partial2 = A & {4{B[2]}};
	assign partial3 = A & {4{B[3]}};

	wire [3:0] low_stage0;
	wire carry_stage0;
	
	add4 multiplier_adder0 (
		.carryin(1'b0),
		.X(partial0),
		.Y({partial1[2:0], 1'b0}),
		.S(low_stage0),
		.carryout(carry_stage0),
		.ovf()
	);

	wire [3:0] high_stage0;

	assign high_stage0 = {3'b000, parial[3]} + carry_stage0;
	
	wire [3:0] low_stage1;
	wire carry_stage1;

	add4 multiplier_adder1 (
		.carryin(1'b0),
		.X(low_stage0),
		.Y({partial2[1:0], 2'b00}),
		.S(low_stage1),
		.carryout(carry_stage1),
		.ovf()
	);

	wire [3:0] high_stage1;

	assign high_stage1 = high_stage0 + {2'b00, partial2[3:2]} + carry_stage1;

	wire [3:0] low_stage2;
	wire carry_stage2;

	add4 multiplier_adder2 (
		.carryin(1'b0),
		.X(low_stage1),
		.Y({partial3[0], 3'b000}),
		.S(low_stage2),
		.carryout(carry_stage2),
		.ovf()
	);

	wire [3:0} high_stage2;

	assign high_stage2 = high_stage1 + {1'b0, partial3[3:1]} + carry_stage2;

	assign X = {high_stage2, low_stage2};		  
	
//
// fill in the verilog code here to implement a 4-bit multiplier, 
// using multiple instances of the add4 module.
//   
   
endmodule // mult4

