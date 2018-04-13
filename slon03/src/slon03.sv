//------------------------------------------------------------------------------
//	Project:       slon03
//	Description:   The Second Xilinx slonick (slon02 - is a Pin Planning Project)
//------------------------------------------------------------------------------

`include "slon03.svh"
`define USE_IO_REGS

//******************************************************************************
//******************************************************************************
module slon03_m  import slon03_lib::*;
(
    input  bit       clk100,
    
    output bit [GREEN_LED_NUM-1:0] ledGreen
);


//------------------------------------------------------------------------------
//    Settings
//
localparam int LED_COUNTER_WIDTH = 28;


//------------------------------------------------------------------------------
//    Types
//
typedef bit [LED_COUNTER_WIDTH-1:0] LedCounter_t;


//------------------------------------------------------------------------------
//    Objects
//
LedCounter_t            ledCounter;
`ifdef USE_IO_REGS
	bit [GREEN_LED_NUM-1:0] ledGreenReg;
`endif

//------------------------------------------------------------------------------
//    Functions and Tasks
//

//------------------------------------------------------------------------------
//     Logic
//

//----
initial begin
	ledCounter  = '0;
	`ifdef USE_IO_REGS
		ledGreenReg = '0;	
	`endif
end

//----
always_ff @(posedge clk100) begin
	ledCounter  <= ledCounter + 1; //LedCounter_t'(1);	
	`ifdef USE_IO_REGS
		ledGreenReg <= ledCounter[(LED_COUNTER_WIDTH-1)-:GREEN_LED_NUM];
	`endif
end

//----
`ifdef USE_IO_REGS
	assign ledGreen = ledGreenReg;
`else
	assign ledGreen = ledCounter[(LED_COUNTER_WIDTH-1)-:GREEN_LED_NUM];
`endif

endmodule : slon03_m