module fifo_sync (
    #(
        parameter FIFO_DEPTH = 8,
        parameter DATA_WIDTH = 32
    )
    (input wire clk,
     input wire rst_n,
     input wire wr_en,
     input wire rd_en,
     input wire [DATA_WIDTH-1:0] data_in,
     output wire [DATA_WIDTH-1:0] data_out,
     output wire empty,
     output wire full
    );
    localparam FIFO_DEPTH_LOG = $clog2(FIFO_DEPTH);
    );
    
endmodule