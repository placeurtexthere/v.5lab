`timescale 1ns/1ps

// Testbench
module tb_shiftreg();

  reg tb_clk = 1'b1;
  reg tb_reset_n = 1'b1;
  reg tb_enable = 1'b0;
  reg tb_direction = 1'b1;
  reg [3:0] tb_parallel_in = 4'b1010;
  reg tb_load = 1'b0;
  wire tb_out;


  shiftreg shiftreg_peldany
  (
    .clk(tb_clk),
    .reset_n(tb_reset_n),
    .enable(tb_enable),
    .direction(tb_direction),
    .parallel_in(tb_parallel_in),
    .load(tb_load),
    .out(tb_out)
  );
  
  initial begin
    #356 tb_reset_n <= 1'b0;
    #356 tb_reset_n <= 1'b1;
    
    #123 tb_enable <= 1'b1;

    #345 tb_load <= 1'b1;

    #876 tb_load <= 1'b0;

    #1000 tb_direction <= 1'b0;
  end

  always begin
    #50 tb_clk <= ~tb_clk;
  end

endmodule // tb_shiftreg