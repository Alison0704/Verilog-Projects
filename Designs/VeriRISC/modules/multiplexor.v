module multiplexor(
    input [4:0]in0,
    input [4:0]in1,
    input sel,
    output reg [4:0]out
);
    
    always @(in0, in1,sel, out) begin
        if(sel == 1)
            out = in1;
        else
            out = in0; 
    end
endmodule