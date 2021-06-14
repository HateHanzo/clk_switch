//file name: sim_tb.v
//function : testbench file for clk_switch
//author   : HateHanzo

module sim_tb();

//parametr
parameter DLY         = 1              ;


//-----------------------------
//--signal
//-----------------------------
reg                       clka         ;
reg                       clkb         ;
reg                       rst_n        ;
reg                       selb         ;


//-----------------------------
//--instance
//-----------------------------
clk_switch clk_switch(
  .clka  (clka  ) , 
  .clkb  (clkb  ) , 
  .rst_n (rst_n ) , 
  .selb  (selb  ) , 

  .clkout() 

);



//-----------------------------
//--gennerate clk
//-----------------------------
always #(20)  clka = !clka ;
always #(5)   clkb = !clkb ;

//-----------------------------
//--test pat
//-----------------------------
initial begin
//initial
  clka = 1'b0 ;
  clkb = 1'b0 ;
	
   rst_n = 1'b1 ;
#1 rst_n = 1'b0 ;
#1 rst_n = 1'b1 ;

  selb = 0 ;
# 1000 ;
  selb = 1 ;

  # 10000;
$finish  ;//for stop
end

//dump wave file
initial  begin
  $fsdbDumpfile("wave.fsdb");
  $fsdbDumpvars;
end



//-----------------------------
//--task define
//-----------------------------

endmodule




