// Design
module shiftreg(
  input clk,
  input reset_n,
  input enable,
  input direction,
  input [3:0] parallel_in,
  input load,
  output  reg out);

  reg [3:0] content;
  
  always@(posedge clk or negedge reset_n) begin
    if(reset_n==1'b0) begin
      content <= 4'b0;
      out <= 1'b0;
    end else begin 
      if(enable==1'b1)
        if(load==1'b1) content <= parallel_in;
      else begin 
          //a legfelso bitet kirakjuk a kimenetre
          out <= content[3];
          // az also harom bit utan odafuzunk egy nullas bitet
          // concatenation operator { , }
          content <= {content[2:0], 1'b0};
        end
    end
  end

endmodule // shiftreg