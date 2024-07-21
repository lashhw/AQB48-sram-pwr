`timescale 1ns / 1ps
`include "../include/rf_2p_hse_params.vh"

`define CYCLE_TIME 4.0

`define NUM_READS  1000000
`define NUM_WRITES 0

module tb_rf_2p_hse;

// input
logic                   CLK;
logic                   CENA;
logic [`ADDR_WIDTH-1:0] AA;
logic                   CENB;
logic [`ADDR_WIDTH-1:0] AB;
logic [      `BITS-1:0] DB;

// output
logic [      `BITS-1:0] QA;

// intermediate
logic [`ADDR_WIDTH-1:0] AA_prev;
logic [      `BITS-1:0] mem [0:`WORDS-1];

rf_2p_hse_wrapper DUT (
    .clk(CLK),
    .CENA(CENA),
    .AA(AA),
    .QA(QA),
    .CENB(CENB),
    .AB(AB),
    .DB(DB)
);

always #(`CYCLE_TIME/2.0) CLK = ~CLK;

initial begin
    CLK  <= 0;
    CENA <= 1;
    CENB <= 1;
    @(posedge CLK);

    // initialize
    CENB <= 0;
    for (int i = 0; i < `WORDS; i = i + 1) begin
        AB <= i;
        mem[i] = $urandom;
        DB <= mem[i];
        @(posedge CLK);
    end
    CENB <= 1;

    // read
    CENA <= 0;
    for (int i = 0; i < `NUM_READS; i++) begin
        AA <= $urandom;
        @(negedge CLK);
        if (i != 0)
            assert(QA === mem[AA_prev]);
        @(posedge CLK);
        AA_prev = AA;
    end
    CENA <= 1;

    // write
    CENB <= 0;
    repeat (`NUM_WRITES) begin
        AB <= $urandom;
        DB <= $urandom;
        @(posedge CLK);
    end
    CENB <= 1;

    $finish;
end

endmodule
