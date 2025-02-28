class adder_test extends uvm_test;

virtual adder_interface vif;
adder_env u_env;
		adder_base_sequence u_seq;

`uvm_component_utils(adder_test)

extern function new( string name = "adder_test",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);

endclass //adder_test

function adder_test::new(string name,uvm_component parent);
 super.new(name,parent);
endfunction : new

function void adder_test::build_phase(uvm_phase phase);
 super.build_phase(phase);

 `uvm_info(get_type_name(),"In Build Phase ...",UVM_NONE)
	u_env=adder_env::type_id::create("u_env",this);
endfunction : build_phase

task adder_test::run_phase(uvm_phase phase);
	super.run_phase(phase);

		`uvm_info(get_type_name(),"In Run Phase ...",UVM_NONE)
		u_seq=adder_base_sequence::type_id::create("u_seq",this);
		phase.raise_objection( this, "Starting phase objection");

		`uvm_info(get_type_name(), $sformatf("Starting Sequence"), UVM_LOW)
		u_seq.start(u_env.u_agent.u_sqr);

		phase.drop_objection( this, "Dropping phase objection");
endtask: run_phase
