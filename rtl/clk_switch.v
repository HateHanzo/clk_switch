//file name: clk_switch.v
//function : original clk-switch from Peter Alfke
//author   : HateHanzo

module clk_switch(
  clka   , 
  clkb   , 
  rst_n  , 
  selb   , 

  clkout 

);

//parametr
parameter DLY         = 1              ;

//input output
input                      clka    ;
input                      clkb    ;
input                      rst_n   ;
input                      selb    ;

output                     clkout  ;

//-----------------------------
//--signal
//-----------------------------
reg dffa ;
reg dffb ;

//-----------------------------
//--main circuit
//-----------------------------
wire clka_n = ~clka ;
wire clkb_n = ~clkb ;

always@(posedge clka_n or negedge rst_n)
begin
  if(!rst_n)
    dffa <= 1'b0 ;
  else
    dffa <= #DLY (~selb) & (~dffb) ;
end

always@(posedge clkb_n or negedge rst_n)
begin
  if(!rst_n)
    dffb <= 1'b0 ;
  else
    dffb <= #DLY selb & (~dffa) ;
end

wire selA = clka & dffa ;
wire selB = clkb & dffb ;

assign clkout = selA | selB ;

endmodule





