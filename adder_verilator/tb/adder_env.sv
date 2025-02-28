class adder_env extends uvm_env;

`uvm_component_utils(adder_env)
adder_agent u_agent;
adder_scoreboard u_sb;
adder_coverage u_cov;

extern function new( string name = "adder_env",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass //adder_env

function adder_env::new(string name,uvm_component parent);
	super.new(name,parent);
endfunction : new

function void adder_env::build_phase(uvm_phase phase);
 super.build_phase(phase);

 `uvm_info(get_type_name(),"In Build Phase ...",UVM_NONE)
	u_agent=adder_agent::type_id::create("u_agent",this);
	u_sb=adder_scoreboard::type_id::create("u_sb",this);
	u_cov=adder_coverage::type_id::create("u_cov",this);

endfunction : build_phase

function void adder_env::connect_phase(uvm_phase phase);
 super.connect_phase(phase);
 `uvm_info(get_type_name(),"Connecting monitor and Scoreboard",UVM_NONE)
	u_agent.u_monitor.mon_aport.connect(u_sb.sb_export);	u_agent.u_monitor.mon_aport.connect(u_cov.cov_export);
endfunction : connect_phase
