class adder_scoreboard extends uvm_scoreboard;

virtual adder_interface vif;
uvm_analysis_imp#(adder_seq_item,adder_scoreboard) sb_export;

`uvm_component_utils(adder_scoreboard)

extern function new( string name = "adder_scoreboard",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);
extern virtual function void write(adder_seq_item pkt);
endclass //adder_scoreboard

function adder_scoreboard::new(string name,uvm_component parent);
	super.new(name,parent);
	sb_export=new("sb_export", this);
endfunction : new

function void adder_scoreboard::build_phase(uvm_phase phase);
 super.build_phase(phase);

 `uvm_info(get_type_name(),"In Build Phase ...",UVM_NONE)

endfunction : build_phase

task adder_scoreboard::run_phase(uvm_phase phase);
	super.run_phase(phase);

 `uvm_info(get_type_name(),"In Run Phase ...",UVM_NONE)

endtask: run_phase

function void adder_scoreboard::write(adder_seq_item pkt);
	pkt.print();
endfunction : write
