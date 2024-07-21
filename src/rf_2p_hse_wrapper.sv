`timescale 1ns / 1ps
`include "../include/rf_2p_hse_params.vh"

module rf_2p_hse_wrapper (
    output                   CENYA,
    output [`ADDR_WIDTH-1:0] AYA,
    output                   CENYB,
    output [`ADDR_WIDTH-1:0] AYB,
    output [      `BITS-1:0] DYB,
    output [      `BITS-1:0] QA,
    input                    clk,
    input                    CENA,
    input  [`ADDR_WIDTH-1:0] AA,
    input                    CENB,
    input  [`ADDR_WIDTH-1:0] AB,
    input  [      `BITS-1:0] DB,
    input  [            2:0] EMAA,
    input                    EMASA,
    input  [            2:0] EMAB,
    input  [            1:0] EMAWB,
    input                    TENA,
    input                    BENA,
    input                    TCENA,
    input  [`ADDR_WIDTH-1:0] TAA,
    input  [      `BITS-1:0] TQA,
    input                    TENB,
    input                    TCENB,
    input  [`ADDR_WIDTH-1:0] TAB,
    input  [      `BITS-1:0] TDB,
    input                    RET1N,
    input                    STOVA,
    input                    STOVB,
    input                    COLLDISN
);

rf_2p_hse rf_2p_hse_inst (
    .CLKA(clk),
    .CLKB(clk),
    .*
);

endmodule