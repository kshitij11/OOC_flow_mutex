`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:52 08/11/2017 
// Design Name: 
// Module Name:    test_gen 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module test_gen(clk, reset,
    req0, req1, grant0, grant1);

input clk, reset;
input grant0, grant1;
output req0, req1;

reg [7:0] count;
reg req0_temp, req1_temp;

	/*always @(posedge clk) begin
	
		if (reset == 0) begin
			req0_temp = 0;
			req1_temp = 0;
			count = 0;
		end
		else if (grant0 == 1) begin
			req0_temp = 0;
			count = count + 1;
		end
		else if (grant1 == 1) begin
			req1_temp = 0;
			count = count + 1;
		end
		else begin
			if (count%16 == 0)
				req1_temp = 1;
			if ((count%4 == 0) && (count != 0))
				req0_temp = 1;
			count = count + 1;
		end
	
	end*/
		
	always @(posedge clk) begin
	
		if (reset == 0) begin
			req0_temp = 0;
		end
		else begin
			if (req0_temp == 0 && grant0 == 0)
				req0_temp = 1;
			else if (grant0 == 1 && req0_temp == 1)
				req0_temp = 0;
		end
	
	end
	
	always @(negedge clk) begin
	
		if (reset == 0) begin
			req1_temp = 0;
		end
		else begin
			if (req1_temp == 0 && grant1 == 0)
				req1_temp = 1;
			else if (grant1 == 1 && req1_temp == 1)
				req1_temp = 0;
		end
	
	end

assign req0 = req0_temp;
assign req1 = req1_temp;
//assign req1 = 0;

/*always @(posedge clk) begin
	if (reset == 0) begin
		req0_temp = 0;
	end
	else begin
		req0_temp = ~grant0;
	end
end

always @(posedge clk) begin
	if (reset == 0) begin
		req1_temp = 0;
	end
	else begin
		req1_temp = ~grant1;
	end
end
	
delay_line1 dl2 (.in(req1_temp), .out(req1));

assign req0 = req0_temp;
//assign req1 = req1_temp;*/

endmodule
