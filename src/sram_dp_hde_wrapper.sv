`timescale 1ns / 1ps
`include "../include/sram_dp_hde_params.vh"

module sram_dp_hde_wrapper (
    output                   CENYA,
    output                   WENYA,
    output [`ADDR_WIDTH-1:0] AYA,
    output [      `BITS-1:0] DYA,
    output                   CENYB,
    output                   WENYB,
    output [`ADDR_WIDTH-1:0] AYB,
    output [      `BITS-1:0] DYB,
    output [      `BITS-1:0] QA,
    output [      `BITS-1:0] QB,
    input                    clk,
    input                    CENA,
    input                    WENA,
    input [ `ADDR_WIDTH-1:0] AA,
    input [       `BITS-1:0] DA,
    input                    CENB,
    input                    WENB,
    input [ `ADDR_WIDTH-1:0] AB,
    input [       `BITS-1:0] DB,
    input [             2:0] EMAA,
    input [             1:0] EMAWA,
    input                    EMASA,
    input [             2:0] EMAB,
    input [             1:0] EMAWB,
    input                    EMASB,
    input                    TENA,
    input                    BENA,
    input                    TCENA,
    input                    TWENA,
    input [ `ADDR_WIDTH-1:0] TAA,
    input [       `BITS-1:0] TDA,
    input [       `BITS-1:0] TQA,
    input                    TENB,
    input                    BENB,
    input                    TCENB,
    input                    TWENB,
    input [ `ADDR_WIDTH-1:0] TAB,
    input [       `BITS-1:0] TDB,
    input [       `BITS-1:0] TQB,
    input                    RET1N,
    input                    STOVA,
    input                    STOVB,
    input                    COLLDISN
);

sram_dp_hde sram_dp_hde_inst (
    .CLKA(clk),
    .CLKB(clk),
    .*
);

endmodule