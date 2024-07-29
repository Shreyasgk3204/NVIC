`timescale 1ns/ 1ps
`default_nettype none
module EXTI_CONTROLLER (input wire [20:0] EXTI_IMR,
			input wire [20:0] EXTI_RTSR,
			input wire [20:0] EXTI_FTSR,
			input wire [20:0] EXTI_EMR,
			input wire [20:0] signal_line,
			output reg [20:0] EXTI_PR,
			output reg [20:0] EVENT_GEN
);

reg [20:0] IMR,RTSR,FTSR,EMR;
integer k,i;
wire [20:0] EDGE_DETECTED;
always@(*)
begin
	IMR <= EXTI_IMR;
	FTSR <= EXTI_FTSR;
	RTSR <= EXTI_RTSR;
	EMR <= EXTI_EMR;
end
// Interrupt detection
always@(*)
begin
	for(k=0; k<=20 ; k=k+1) begin
		EXTI_PR[k] <= IMR[k] & EDGE_DETECTED[k];
		end
end
// Event detection
always@(*)
begin
	for(i=0; i<=20	; i=i+1) begin
		EVENT_GEN[i] <= EMR[k] & EDGE_DETECTED[k];
	end
end


EDGE_DETECTOR inst1(  .EXTI_FTSR(FTSR),
		      .EXTI_RTSR(RTSR),
		      .signal_line(signal_line),
		      .EDGE_DETECTED(EDGE_DETECTED)
);

endmodule



				
