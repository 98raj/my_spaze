```systemverilog
class adder_driver extends uvm_driver#(adder_seq_item);
`uvm_component_utils(adder_driver)

virtual adder_interface vif;

extern function new( string name = "adder_driver",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);

endclass // adder_driver


function adder_driver::new(string name,uvm_component parent);
 super.new(name,parent);
endfunction : new

function void adder_driver::build_phase(uvm_phase phase);
 super.build_phase(phase);

 `uvm_info(get_type_name(),"In Build Phase ...",UVM_NONE)
	if(!uvm_config_db#(virtual adder_interface)::get(this, "", "vif", vif))
		begin
		`uvm_fatal("NO_VIF",{"virtual interface must be set for:" ,get_full_name(),".vif"});
		end
endfunction : build_phase

task adder_driver::run_phase(uvm_phase phase);
	super.run_phase(phase);

 `uvm_info(get_type_name(),"In Run Phase ...",UVM_NONE)
	forever begin //{
		adder_seq_item tr;
		seq_item_port.get_next_item(tr);
		uvm_report_info(get_type_name(), $sformatf("Got Input Transaction %s",tr.input2string()));

		vif.in1 <= tr.in1;
		vif.in2 <= tr.in2;
		@(posedge vif.clk);
    	tr.out = vif.out;

		uvm_report_info(get_type_name(), $sformatf("Got Response %s",tr.output2string()));
		seq_item_port.item_done(tr);
	end //}

endtask: run_phase
```