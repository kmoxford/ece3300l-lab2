
module calculator (
		   input [1:0]	OP,
		   input [3:0]	A, B,
		   output [9:0]	out
		   );

   wire				cout, ovf;  // carry_out and overflow
   wire [3:0]			outa;  // adder output
   wire [7:0]			outm; // multiplier output
	
	wire [9:0] adder_output; 
	wire [9:0] multiplier_output;

	addsub4 adder_subtractor (
		.A(A),
		.B(B),
		.subsel(OP[0]),
		.X(outa),
		.cout(cout),
		.ovf(ovf)
	); 

	assign adder_output = {ovf, cout, 4'b0000, outa}; // instance for addsub4 complete

	mult4 multiplier (
		.A(A),
		.B(B),
		.X(outm)
	);

	assign multiplier_output = {2'b00, outm}; // instance for mult4 complete 

	mux10 output_mux (
		.in0(adder_output), 
		.in1(multiplier_output),
		.sel(OP[1]),
		.out(out)
	); //instance for mux complete 

//
// make instances of the three modules addsub4, mult4, and mux10 x
// and wire them up to create the functionality required. x
//
	
endmodule // calculator x

