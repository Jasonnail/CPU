`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/09 20:35:47
// Design Name: 
// Module Name: tb_cpu
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


module tb_cpu();
reg         clk,rst,en_in,en_ram_out;
reg  [15:0] ins;
wire        en_ram_in;
wire [15:0] addr;

cpu test_cpu(
    .clk (clk),
    .rst (rst),
    .en_in (en_in),
    .en_ram_in (en_ram_in), 
    .ins (ins),	
    .en_ram_out (en_ram_out),
    .addr (addr)   	
);

parameter Tclk = 10;

initial begin
                        clk=0;
			forever #(Tclk/2) clk=~clk;
		end
        
initial begin
		rst=0;
		  #(Tclk*4)	rst=1; 
		end

initial begin                
		        en_in=0;
                en_ram_out=0;
       #(Tclk*2) en_in=1;
                en_ram_out=1;
end

initial begin
          ins=0000_0000_0000_0001;
#(Tclk*12)ins=16'b0001_1001_0000_0000;
#(Tclk*12)ins=16'b0011_0110_0000_0000;
#(Tclk*12)ins=16'b0110_1100_0000_0110;
//#(Tclk*12)ins=16'b0000_0100_0000_0010;
//#(Tclk*12)ins=16'b0010_0100_0000_0100;
//#(Tclk*12)ins=16'b0101_0110_0000_0000;
//#(Tclk*12)ins=16'b0111_0110_0000_0000;
//#(Tclk*12)ins=16'b1001_0110_0000_0000;
//#(Tclk*12)ins=16'b1010_0000_0000_0001;
        end
       
initial begin
    #(Tclk*300)  $stop;
end

endmodule
