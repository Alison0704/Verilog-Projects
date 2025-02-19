module register #(parameter WIDTH = 8) 
(
    input [WIDTH-1:0] data_in,
    input clk, load, rst,
    output reg [WIDTH-1:0] data_out
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 0;
        end
        else if (load) begin
            data_out <= data_in;
        end
    end

endmodule