import uvm_pkg:: *;
`include "uvm_macros.svh"
`include "adder_seq_item.sv"
`include "adder_sequencer.sv"
`include "adder_base_sequence.sv"
`include "adder_driver.sv"
`include "adder_interface.sv"
`include "adder_monitor.sv"
`include "adder_agent.sv"
`include "adder_scoreboard.sv"
`include "adder_coverage.sv"
`include "adder_env.sv"
`include "adder_test.sv"

module adder_top;

//--------------------------------------
//signal declaration: clock and reset
//--------------------------------------
bit clk;

initial begin
 clk=0;
end
//--------------------------------------
//clock Generation
//--------------------------------------
always begin
	#5 clk <= ~clk;
end

//--------------------------------------
//Interface Instance
//--------------------------------------
adder_interface intf(clk);

//--------------------------------------
//DUT Instance
//--------------------------------------
 adder UUT(
	.clk(intf.clk),
	.reset(intf.reset),
	.in1(intf.in1),
	.in2(intf.in2),
	.out(intf.out)
);

initial begin
	uvm_config_db#(virtual adder_interface)::set(uvm_root::get(), "*", "vif", intf);
	//enable wave dump
	$dumpfile("dump.vcd");
	$dumpvars;
end

initial begin
	run_test("adder_test");
end

endmodule //adder_top
