// Design
// D flip-flop
module dff(
  input clk,
  input reset,
  input [3:0]d,
  input load,
  output reg [3:0]q,
  output [3:0]qn);

  assign qn = ~q;
  
  always @(posedge clk or posedge reset)
  begin
      if (reset) begin
        // Aszinkron, magas aktiv reset
        q <= 4'b0000;
      end else begin
        // Ha reset nem aktiv, akkor az orajel felfuto elere a q kimenet megkapja d bemenet erteket
        if (load) begin
          q <= d;
        end
      end
  end
endmodule