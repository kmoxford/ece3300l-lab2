
module addsub4 (
	       input [3:0] A, B,
	       input subsel,
	       output [3:0] X,
	       output cout, ovf
	       );

	wire [3:0] B_modified;

	assign B_modified = B ^ {4{subsel}};

	add4 adder_instance (
		.carryin(subsel),
		.X(A), .Y(B_modified),
		.S(X),
		.carryout (cout),
		.ovf(ovf)
	);
//
// fill in the verilog code here, using the add4 module,
//   to implement both addition and subtraction.
//
	assign ovf[0] = B[0] ^ subsel; // overflow bit 0 = bit 0 of B XOR with subsel
endmodule

