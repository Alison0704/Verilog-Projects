module moduleName(
    input a, b, c, ctrl,
    input[3:0] f,
    output reg d
);
always @(*) begin
    if (f < 4'b0110)
        d = a & b;
    else 
        if(ctrl)
            d = 1'b0;
        else
            d = c;
    end
    
endmodule