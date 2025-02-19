module module6 (
    input a, b, c, sel, clk,
    output reg op
);

wire b_or_c;
wire a_prime;

//NOT GOOD
always @(posedge clk) begin
    if (sel) 
    begin
        b_or_c = c;
        a_prime <= a & b_or_c;
        op <= c;
    end
    else
        b_or_c = b;
        a_prime <= a & b_or_c;
        op <= a_prime;    
end

//ANSWER

always @(posedge clk)
    rg <= sel ? c : b;

always @(posedge clk)
    op <= sel ? c : a & rg;

    
endmodule