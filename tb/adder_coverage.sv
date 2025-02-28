class adder_coverage extends uvm_subscriber#(adder_seq_item);

`uvm_component_utils(adder_coverage)
adder_seq_item item;
uvm_analysis_imp#(adder_seq_item,adder_coverage) cov_export;
covergroup cg_adder_coverage;

	option.per_instance = 1;
	option.name="Coverage for  adder";
	option.comment="Add your comment";
	option.goal=100;

	cp_in1: coverpoint (item.in1)
	{
		option.auto_bin_max = 2;
	}
	cp_in2: coverpoint (item.in2)
	{
		option.auto_bin_max = 2;
	}

	cross_cp: cross cp_in1, cp_in2;

endgroup: cg_adder_coverage
extern function new( string name = "adder_coverage",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);
extern virtual function void write(adder_seq_item t);
extern function void report_phase(uvm_phase phase);

endclass //adder_coverage

function adder_coverage::new(string name,uvm_component parent);
	super.new(name,parent);
	cg_adder_coverage=new();
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
	cg_adder_coverage.sample();
endfunction : write

function void adder_coverage:: report_phase(uvm_phase phase);
	super.report_phase(phase);
	`uvm_info(get_full_name(),$sformatf("Coverage is %f",cg_adder_coverage.get_coverage()),UVM_LOW);
endfunction: report_phase