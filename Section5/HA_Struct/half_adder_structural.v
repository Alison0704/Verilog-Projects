module half_adder_stuctural(
    input a,
    input b,
    output sum,
    output carry
    );

    xor XOR1(sum, a, b);
    and AND1(carry, a, b);
    
endmodule

module testbench();
    reg a;
    reg b;
    wire sum;
    wire carry;

    half_adder_stuctural HALF_ADD(
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