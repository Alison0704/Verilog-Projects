module memory #(
    parameter AWIDTH = 5,
    parameter DWIDTH = 8
) (
    input [AWIDTH-1:0] addr,
    input clk, wr, rd,
    inout [DWIDTH-1:0] data
);

    reg [DWIDTH-1:0] mem [0:(2**AWIDTH)-1];  // Correct memory size
    reg [DWIDTH-1:0] data_out;
    reg data_enable;

    always @(posedge clk) begin
        if (wr) begin
            mem[addr] <= data;  // Write data into memory
        end
        if (rd) begin
            data_out <= mem[addr];  // Read from memory
        end
    end

    assign data = (rd) ? data_out : {DWIDTH{1'bz}};  // Tristate logic

endmodule
