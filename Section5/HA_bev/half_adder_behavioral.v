module half_adder_behavioral(
    input a, 
    input b,
    output reg sum,
    output reg carry
    );

    always @(*) begin
        sum = a ^ b;
        carry = a & b;
    end

endmodule

module testbench();

reg a;
reg b;
wire sum;
wire carry;

half_adder_behavioral HALF_ADD(
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

initial begin
    $monitor("a=%b, b=%b, sum=%b, carry=%b", a, b, sum, carry);
end

initial begin
    #1; a=0; b=0;
    #1; a=0; b=1;
    #1; a=1; b=0;
    #1; a=1; b=1;
    #1; a=0; b=0;
    #1; a=1; b=1;
end

endmodule