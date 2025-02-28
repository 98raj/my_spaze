class adder_agent extends uvm_agent;

`uvm_component_utils(adder_agent)
adder_sequencer u_sqr;
adder_driver u_driver;
adder_monitor u_monitor;

virtual adder_interface vif;

extern function new( string name = "adder_agent",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass //adder_agent

function adder_agent::new(string name,uvm_component parent);
	super.new(name,parent);
endfunction : new

function void adder_agent::build_phase(uvm_phase phase);
 super.build_phase(phase);

 `uvm_info(get_type_name(),"In Build Phase ...",UVM_NONE)
	u_sqr     =adder_sequencer   ::type_id::create("u_sqr",this);
	u_driver  =adder_driver ::type_id::create("u_driver",this);
	u_monitor =adder_monitor::type_id::create("u_monitor",this);
endfunction : build_phase

function void adder_agent::connect_phase(uvm_phase phase);
 super.connect_phase(phase);
 `uvm_info(get_type_name(),"In Connect Phase ...",UVM_NONE)

 u_driver.seq_item_port.connect(u_sqr.seq_item_export);
 `uvm_info(get_type_name(),"CONNECT_PHASE:Connected Driver and Sequencer",UVM_NONE)
endfunction : connect_phase
