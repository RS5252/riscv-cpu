module alu_tb;

reg [31:0] a, b;
reg [1:0] alu_op;
wire [31:0] result;

alu dut (
	.a(a),
	.b(b),
	.alu_op(alu_op),
	.result(result)
);

initial begin
	$dumpfile("alu.vcd");
	$dumpvars(0, alu_tb);


	a = 10;
	b = 3;

	// ADD
	alu_op = 2'b00;
	#10;
	if (result !== 13) $fatal(1, "ADD failed");

	// SUB
	alu_op = 2'b01;
	#10;
	if (result !== 7) $fatal(1, "SUB failed");

	// AND
	alu_op = 2'b10;
	#10;
	if (result !== 2) $fatal(1, "AND failed");

	// OR
	alu_op = 2'b11;
	#10;
	if (result !== 11) $fatal(1, "OR failed");

	$display("All ALU tests passed!");
	$finish;
end

endmodule
