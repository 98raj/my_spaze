class adder_coverage extends uvm_subscriber#(adder_seq_item);

`uvm_component_utils(adder_coverage)
adder_seq_item item;
uvm_analysis_imp#(adder_seq_item,adder_coverage) cov_export;

extern function new( string name = "adder_coverage",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);
extern virtual function void write(adder_seq_item t);
extern function void report_phase(uvm_phase phase);

endclass //adder_coverage

function adder_coverage::new(string name,uvm_component parent);
	super.new(name,parent);
endfunction : new

function void adder_coverage::build_phase(uvm_phase phase);
 super.build_phase(phase);
	cov_export=new("cov_export", this);

 `uvm_info(get_type_name(),"In Build Phase ...",UVM_NONE)

endfunction : build_phase

function void adder_coverage::connect_phase(uvm_phase phase);
	super.connect_phase(phase);

 `uvm_info(get_type_name(),"In Connect Phase ...",UVM_NONE)

endfunction: connect_phase

task adder_coverage::run_phase(uvm_phase phase);
	super.run_phase(phase);

 `uvm_info(get_type_name(),"In Run Phase ...",UVM_NONE)

endtask: run_phase

function void adder_coverage::write(adder_seq_item t);
	item=t;
endfunction : write

function void adder_coverage:: report_phase(uvm_phase phase);
	super.report_phase(phase);
endfunction: report_phase