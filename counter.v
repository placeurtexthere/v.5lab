// Design
module counter(
  input clk,
  input reset_n,
  input enable,
  input direction,
  input [3:0] parallel_in, // 4 bites soros bemenet létrehozás 
  input load,
  output reg [3:0] cout); // 4 kimenet létrehozás

  always@(posedge clk or negedge reset_n) begin
    if(reset_n==1'b0) cout <= 4'b0;
    else 
      if(enable==1'b1)
        if(load==1'b1) cout <= parallel_in;
      else cout <= cout + 1'b1;
  end

endmodule // counter