`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2017 18:04:41
// Design Name: 
// Module Name: tb_spec_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module anthill_tb();

parameter g_riscv_firmware="boot.dat";

wire [3:0] leds_o;
wire  uart_txd_o;
wire [41:0] ck_io;
reg uart_rxd_i = 1;
reg clk = 0 ;
reg rstn = 1 ;
//reg [7:0] irq_i = 0;

initial begin
  $dumpfile("anthill.vcd");
  $dumpvars;
  #1000000
  $finish;
end

anthill #(
  .g_simulation(1),
  .g_riscv_firmware(g_riscv_firmware)
)
DUT (
  .CLK100MHZ (clk),
  .resetn (rstn),
  //.irq_i(irq_i),
  .uart_txd_o ( uart_txd_o ),
  .uart_rxd_i ( uart_rxd_i ),

  .ck_io(ck_io),
  .leds_o (leds_o),
  .sw_i(4'b1010)
);

initial begin
   forever #5 clk <= ~clk;
end

initial begin
   rstn = 0;
   #5 rstn = 1;
end

/*initial begin
   irq_i = 0;
   #5000 irq_i = 8'b11111111;
   #10 irq_i = 0;
end*/


endmodule
