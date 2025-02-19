module alu #(
    parameter WIDTH = 8
) (
    input [WIDTH-1:0] in_a,
    input [WIDTH-1:0] in_b,
    input [2:0] opcode,
    output reg [WIDTH-1:0] alu_out,
    output a_is_zero
);

    assign a_is_zero = (in_a == 0);
    
    always @(*) begin
        case(opcode)
            3'b000: alu_out = in_a; // pass A : HLT
            3'b001: alu_out = in_a; // pass A : SKZ
            3'b010: alu_out = in_a + in_b; // add : ADD
            3'b011: alu_out = in_a & in_b; // and : AND
            3'b100: alu_out = in_a ^ in_b; // xor : XOR
            3'b101: alu_out = in_b; // pass B : LDA
            3'b110: alu_out = in_a; // pass A : STO
            3'b111: alu_out = in_a; // pass A : JMP
        endcase
        
    end
    
endmodule