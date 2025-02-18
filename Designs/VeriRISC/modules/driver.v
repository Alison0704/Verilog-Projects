module driver #(
    parameter WIDTH = 8
) (
    input [WIDTH-1:0] data_in,
    input data_en,
    output [WIDTH-1:0] data_out
);

    assign data_out = data_en ? data_in : 'z;
    
endmodule