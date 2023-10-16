`timescale 1ns/1ps

// Testbench
module tb_dff;

  //kezdoerteket adunk orajelnek, resetnek
  reg tb_clk = 0;
  reg tb_reset = 0;
  reg [3:0]tb_d = 0;
  reg tb_load = 0;
  wire [3:0]tb_q;
  wire [3:0]tb_qn;
  
  // A dff verilog modul peldanyositasa
  dff dff_peldany(
    // a testbench jeleit rakotjuk a dff peldany portjaihoz
    .clk(tb_clk), 
    .reset(tb_reset),
    .d(tb_d),
    .load(tb_load),
    .q(tb_q),
    .qn(tb_qn)
  );

  
  initial begin
    $display("Load = 0");
    #2 tb_load = 1;

    $display("Flip-flop reset aktivalasa");
    #2 tb_reset = 1;
    
    $display("Reset deaktivalasa");
    #10 tb_reset = 0;
    
    $display("Bemenetre 1-et adunk");
    #1 tb_d = 4'b1111;
  end

  // orajel eloallitasa, periodusido 10ns
  // ez az always blokk parhuzamosan ertekelodik ki a fenti initial blokkokkal
  always #5 tb_clk = ~tb_clk;
  
endmodule