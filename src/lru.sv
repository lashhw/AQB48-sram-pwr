`timescale 1ns / 1ps
module lru (
    clk, hit, hit_way, old_lru_bits, replace_way, new_lru_bits
);

input              clk;
input              hit;
input        [1:0] hit_way;
input        [2:0] old_lru_bits;
output logic [1:0] replace_way;
output logic [2:0] new_lru_bits;

logic [1:0] mru_way;

always_comb begin
    casez (old_lru_bits)
        3'b00?: replace_way = 0;
        3'b10?: replace_way = 1;
        3'b?10: replace_way = 2;
        3'b?11: replace_way = 3;
    endcase
end

always_ff @(posedge clk) begin
    case (mru_way)
        2'd0: new_lru_bits <= { 2'b11, old_lru_bits[0] };
        2'd1: new_lru_bits <= { 2'b01, old_lru_bits[0] };
        2'd2: new_lru_bits <= { old_lru_bits[2], 2'b01 };
        2'd3: new_lru_bits <= { old_lru_bits[2], 2'b00 };
    endcase
end

assign mru_way = hit ? hit_way : replace_way;

endmodule
