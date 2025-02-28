
interface adder_interface (input logic  clk);

logic reset; 
logic [7:0] in1;
logic [7:0] in2; 
logic [8:0] out;
//--------------------------------------
//Driver Clocking Block
//--------------------------------------
clocking driver_cb @(posedge clk);
	default input #1 output #1;
	output  in1;
	output  in2;
	input  out;

endclocking //driver_cb
//--------------------------------------
//Monitor Clocking Block
//--------------------------------------
clocking monitor_cb @(posedge clk);
default input #1 output #1;
	input  in1;
	input  in2;
	input  out;

endclocking //monitor_cb
endinterface //adder_interface