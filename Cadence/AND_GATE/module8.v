module module8 (
    input [3:0] a, b,
    input [4:0] c,
    input add,
    output reg [3:0] y
);
    assign y = add ? a + b : c;

    always @(*)
        y = add ? a + b : c;
    
    
endmodule