
module addsub4 (
	       input [3:0] A, B,
	       input subsel,
	       output [3:0] X,
	       output cout, ovf
	       );

//
// fill in the verilog code here, using the add4 module,
//   to implement both addition and subtraction.
//
	wire [2:0] carry;
	
	fulladd v1 (a[0], b[0], 1'b0, result[0], carry[0]);
	fulladd v2 (a[1], b[1], carry[0], result[1], carry[1]);
	fulladd v3 (a[2], b[2], carry[1], result[2], carry[2]);
	fulladd v4 (a[3], b[3], carry[2], result[3], result[4]);
   
endmodule

