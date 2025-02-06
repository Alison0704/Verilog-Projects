module multiplexor_test();
    reg [4:0]in0;
    reg [4:0]in1;
    reg sel;
    wire [4:0]out;

    multiplexor MULTIPLEXOR(
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .out(out)
    );

    initial begin
        $monitor("in0=%b, in1=%b, sel=%b, out=%b", in0, in1, sel, out);
    end

    initial begin
        #1; in0=5'b00000; in1=5'b00000; sel=0;
        #1; in0=5'b00000; in1=5'b00001; sel=1;
        #1; in0=5'b00001; in1=5'b00000; sel=0;
        #1; in0=5'b00001; in1=5'b00001; sel=1;
        #1; in0=5'b00000; in1=5'b00000; sel=0;
        #1; in0=5'b00001; in1=5'b00001; sel=1;
        #5; $finish;
    end

    
endmodule