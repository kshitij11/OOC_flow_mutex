`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2017 10:39:10 AM
// Design Name: 
// Module Name: top
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



module top (clk_p, clk_n, reset);

(* io_buffer_type="IBUF" *)
input clk_p, clk_n;
(* io_buffer_type="IBUF" *)
input reset;

wire clk;
IBUFGDS buffer(.O(clk), .I(clk_p), .IB(clk_n));

(* mark_debug = "true", mark_debug_clock = "clk", mark_debug_depth = "4096", mark_debug_adv_trigger = "true" *)
wire req0, req1, grant0, grant1;

(* DONT_TOUCH = "yes" *)
test_gen t0 (.reset(~reset), .clk(clk), .req0(req0), .req1(req1), .grant0(grant0), .grant1(grant1));


(* DONT_TOUCH = "yes" *)
mutex2 mutex (.req0(req0), .req1(req1), .grant0(grant0), .grant1(grant1));

endmodule

