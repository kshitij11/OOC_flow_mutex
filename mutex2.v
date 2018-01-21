`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2017 10:22:30 AM
// Design Name: 
// Module Name: mutex3
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


//Mapping 1
module mutex2 (req0, req1, grant0, grant1);

(* DONT_TOUCH = "yes" *) 
input req0, req1;

(* DONT_TOUCH = "yes" *) 
output grant0, grant1;

//Cross-coupled NANDs followed by a filter stage to resolve metastability

(* DONT_TOUCH = "yes" *) 
wire mid0, mid1;

(* DONT_TOUCH = "yes" *) 
assign mid0 = !(req0 & mid1);
(* DONT_TOUCH = "yes" *) 
assign mid1 = !(req1 & mid0);
(* DONT_TOUCH = "yes" *) 
assign grant0 = (!mid0 & mid1);
(* DONT_TOUCH = "yes" *) 
assign grant1 = (mid0 & !mid1);

endmodule

//Mapping 1a
/*module MUTEX3 (req0, req1, grant0, grant1, clk, reset);

(* DONT_TOUCH = "yes" *) 
input req0, req1, clk, reset;

(* DONT_TOUCH = "yes" *) 
output grant0, grant1;

(* DONT_TOUCH = "yes" *)
reg grant0_reg, grant1_reg;
 
(* DONT_TOUCH = "yes" *)
wire grant0_temp, grant1_temp;

//Cross-coupled NANDs followed by a filter stage to resolve metastability

(* DONT_TOUCH = "yes" *) 
wire mid0, mid1;

(* DONT_TOUCH = "yes" *) 
assign mid0 = !(req0 & mid1);
(* DONT_TOUCH = "yes" *) 
assign mid1 = !(req1 & mid0);
(* DONT_TOUCH = "yes" *) 
assign grant0_temp = (!mid0 & mid1);
(* DONT_TOUCH = "yes" *) 
assign grant1_temp = (mid0 & !mid1);

always @(posedge clk) begin

	if (!reset) begin
		grant0_reg <= 0;
		grant1_reg <= 0;
	end
	else begin
		grant0_reg <= grant0_temp;
		grant1_reg <= grant1_temp;
	end
	
end

assign grant0 = grant0_reg;
assign grant1 = grant1_reg;

endmodule*/

//(* RLOC = "X0Y0" *)

//Mapping 2
/*module MUTEX3 (req0, req1, grant0, grant1, reset);

(* DONT_TOUCH = "yes" *) 
input req0, req1, reset;

(* DONT_TOUCH = "yes" *) 
output grant0, grant1;

(* DONT_TOUCH = "yes" *) 
wire clk, clock_en, clk_inv;

(* DONT_TOUCH = "yes" *) 
reg ff0_out, ff1_out, ff2_out, ff3_out;

(* DONT_TOUCH = "yes" *) 
wire ff2_in, ff3_in;

//FF 0
(* DONT_TOUCH = "yes" *) 
always @(posedge clk) begin
	if (!reset) begin
		ff0_out <= 0;
	end
	else begin
		ff0_out <= req0;
	end
end

//FF 1
(* DONT_TOUCH = "yes" *) 
always @(posedge clk) begin
	if (!reset) begin
		ff1_out <= 0;
	end
	else begin
		ff1_out <= req1;
	end
end

(* DONT_TOUCH = "yes" *) 
assign ff2_in = ff0_out & ((~ff1_out) | (~grant1)); 

(* DONT_TOUCH = "yes" *) 
assign ff3_in = ff1_out & ((~ff0_out) | (grant1)); 

//FF 2
(* DONT_TOUCH = "yes" *) 
always @(posedge clk) begin
	if (!reset) begin
		ff2_out <= 0;
	end
	else begin
		ff2_out <= ff2_in;
	end
end

//FF 3
(* DONT_TOUCH = "yes" *) 
always @(posedge clk) begin
	if (!reset) begin
		ff3_out <= 0;
	end
	else begin
		ff3_out <= ff3_in;
	end
end

assign grant0 = ff2_out & (~ff3_out);
assign grant1 = ff3_out & (~ff2_out);

//local clock circuitry

(* DONT_TOUCH = "yes" *) 
assign clock_en = (req0 | req1 | grant0 | grant1);

(* DONT_TOUCH = "yes" *) 
assign clk = clk_inv & clock_en;

(* DONT_TOUCH = "yes" *) 
assign clk_inv = ~clk;

endmodule*/
