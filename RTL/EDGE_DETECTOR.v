`timescale 1ns/ 1ps
`default_nettype none
module EDGE_DETECTOR( input wire [20:0] EXTI_FTSR,
		      input wire [20:0] EXTI_RTSR,
		      input wire [20:0] signal_line,
		      output wire [20:0] EDGE_DETECTED
);
reg [20:0] sig1,sig2;
reg [20:0] pe,ne;
// rising edge detection 
always@(*)
begin
	sig1 <= signal_line;
	
	pe   <= (~sig1) & signal_line;
end

// falling edge detection 
always@(*)
begin
	sig2 <= signal_line;
	
	ne   <= sig2 & (~signal_line) ;
	
end
assign EDGE_DETECTED <= (pe & EXTI_RTSR) | (ne & EXTI_FTSR) ;
endmodule
