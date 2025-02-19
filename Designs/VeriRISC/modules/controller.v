module controller (
    input zero,
    input [2:0] opcode, phase,
    output reg sel, rd, ld_ir, halt, inc_pc, ld_ac, wr, ld_pc, data_e
);

wire ALU_OP = (opcode == 3'b010) | (opcode == 3'b011) | (opcode == 3'b100) | 
(opcode == 3'b101);
wire HALT = (opcode == 3'b000);
wire JMP = (opcode == 3'b111);
wire STO = (opcode == 3'b110);
wire SKZ = (opcode == 3'b001);

always @(*) begin
    case (phase)
        3'b000: begin // INST_ADDR
            sel =       1'b1;
            rd =        1'b0;
            ld_ir =     1'b0;
            halt =      1'b0;
            inc_pc =    1'b0;
            ld_ac =     1'b0;
            ld_pc =     1'b0;
            wr =        1'b0;
            data_e =    1'b0;end
        3'b001: begin // INST_FETCH
            sel =       1'b1;
            rd =        1'b1;
            ld_ir =     1'b0;
            halt =      1'b0;
            inc_pc =    1'b0;
            ld_ac =     1'b0;
            ld_pc =     1'b0;
            wr =        1'b0;
            data_e =    1'b0;end
        3'b010: begin // INST_LOAD
            sel =       1'b1;
            rd =        1'b1;
            ld_ir =     1'b1;
            halt =      1'b0;
            inc_pc =    1'b0;
            ld_ac =     1'b0;
            ld_pc =     1'b0;
            wr =        1'b0;
            data_e =    1'b0;end
        3'b011: begin // IDLE
            sel =       1'b1;
            rd =        1'b1;
            ld_ir =     1'b1;
            halt =      1'b0;
            inc_pc =    1'b0;
            ld_ac =     1'b0;
            ld_pc =     1'b0;
            wr =        1'b0;
            data_e =    1'b0;end
        3'b100: begin // OP_ADDR
            sel =       1'b0;
            rd =        1'b0;
            ld_ir =     1'b0;
            halt =      HALT;
            inc_pc =    1'b1;
            ld_ac =     1'b0;
            ld_pc =     1'b0;
            wr =        1'b0;
            data_e =    1'b0;end
        3'b101: begin // OP_FETCH
            sel =       1'b0;
            rd =        ALU_OP;
            ld_ir =     1'b0;
            halt =      1'b0;
            inc_pc =    1'b0;
            ld_ac =     1'b0;
            ld_pc =     1'b0;
            wr =        1'b0;
            data_e =    1'b0;end
        3'b110: begin // OP_ALU
            sel =       1'b0;
            rd =        ALU_OP;
            ld_ir =     1'b0;
            halt =      1'b0;
            inc_pc =    SKZ && zero;
            ld_ac =     1'b0;
            ld_pc =     JMP;
            wr =        1'b0;
            data_e =    STO; end
        default:begin // INST_ADDR
            sel =       1'b0;
            rd =        ALU_OP;
            ld_ir =     1'b0;
            halt =      1'b0;
            inc_pc =    1'b0;
            ld_ac =     ALU_OP;
            ld_pc =     JMP;
            wr =        STO;
            data_e =    STO;end
    endcase
end
    
endmodule