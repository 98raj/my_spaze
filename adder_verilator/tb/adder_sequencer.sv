class adder_sequencer extends uvm_sequencer#(adder_seq_item,adder_seq_item);

`uvm_component_utils(adder_sequencer)

extern function new( string name = "adder_sequencer",uvm_component parent=null);
extern function void build_phase(uvm_phase phase);

endclass //adder_sequencer

function adder_sequencer::new(string name,uvm_component parent);
 super.new(name,parent);
endfunction : new

function void adder_sequencer::build_phase(uvm_phase phase);
 super.build_phase(phase);
 `uvm_info(get_type_name(),"In Build Phase ...",UVM_NONE)
endfunction : build_phase
