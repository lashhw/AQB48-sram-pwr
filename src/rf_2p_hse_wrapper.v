`timescale 1ns / 1ps
`include "../include/rf_2p_hse_params.vh"

module rf_2p_hse_wrapper (
    input                    clk,

    input                    CENA,
    input  [`ADDR_WIDTH-1:0] AA,
    output [`      BITS-1:0] QA,

    input                    CENB,
    input  [`ADDR_WIDTH-1:0] AB,
    input  [`      BITS-1:0] DB
);

rf_2p_hse rf_2p_hse_inst (
    .CENYA(),
    .AYA(),
    .CENYB(),
    .AYB(),
    .DYB(),
    .QA(QA),
    .CLKA(clk),
    .CENA(CENA),
    .AA(AA),
    .CLKB(clk),
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

endmodule