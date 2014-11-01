/*
  Pat Sabpisal
  ssabpisa@purdue.edu
*/

`ifndef PCIFVH
`define PCIFVH

`include "cpu_types_pkg.vh"

interface pc_if;

  import cpu_types_pkg::*;

  logic ihit, dhit, pc_en;
  logic [2:0] PCSrc;
  word_t rdat1;
  logic [25:0] immediate26;
  logic [15:0] imm16;
  logic branch_flag;

  word_t imemaddr;
  word_t pc_plus_4;
  word_t branch_addr;
  modport pc(
    input ihit, dhit, branch_addr, imm16, immediate26, rdat1, pc_en, PCSrc, branch_flag,
    output imemaddr, pc_plus_4
  );

endinterface

`endif