`timescale 1ns / 1ps
`include "../include/rf_2p_hse_params.vh"

`define CYCLE_TIME 2.0

`define NUM_READS  1000000
`define NUM_WRITES 0

module tb_rf_2p_hse;

// input
logic                   clk;
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
    .CENYA(),
    .AYA(),
    .CENYB(),
    .AYB(),
    .DYB(),
    .QA(QA),
    .clk(clk),
    .CENA(CENA),
    .AA(AA),
    .CENB(CENB),
    .AB(AB),
    .DB(DB),
    .EMAA(3'b0),
    .EMASA(1'b0),
    .EMAB(3'b0),
    .EMAWB(2'b0),
    .TENA(1'b1),
    .BENA(1'b1),
    .TCENA(1'b0),
    .TAA({`ADDR_WIDTH{1'b0}}),
    .TQA({`BITS{1'b0}}),
    .TENB(1'b1),
    .TCENB(1'b0),
    .TAB({`ADDR_WIDTH{1'b0}}),
    .TDB({`BITS{1'b0}}),
    .RET1N(1'b1),
    .STOVA(1'b0),
    .STOVB(1'b0),
    .COLLDISN(1'b1)
);

always #(`CYCLE_TIME/2.0) clk = ~clk;

initial begin
    clk  <= 0;
    CENA <= 1;
    CENB <= 1;
    @(posedge clk);

    // initialize
    CENB <= 0;
    for (int i = 0; i < `WORDS; i = i + 1) begin
        AB <= i;
        mem[i] = $urandom;
        DB <= mem[i];
        @(posedge clk);
    end
    CENB <= 1;

    // read
    CENA <= 0;
    for (int i = 0; i < `NUM_READS; i++) begin
        AA <= $urandom;
        @(negedge clk);
        if (i != 0)
            assert(QA === mem[AA_prev]);
        @(posedge clk);
        AA_prev = AA;
    end
    CENA <= 1;

    // write
    CENB <= 0;
    repeat (`NUM_WRITES) begin
        AB <= $urandom;
        DB <= $urandom;
        @(posedge clk);
    end
    CENB <= 1;

    $finish;
end

endmodule
