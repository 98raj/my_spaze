```systemverilog
class adder_monitor extends uvm_monitor;

  uvm_analysis_port#(adder_seq_item) mon_aport;
  adder_seq_item rx;

  `uvm_component_utils(adder_monitor)

  virtual adder_interface vif;

  extern function new( string name = "adder_monitor",uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass

function adder_monitor::new(string name,uvm_component parent);
  super.new(name,parent);
  mon_aport = new("mon_aport", this);
endfunction

function void adder_monitor::build_phase(uvm_phase phase);
  super.build_phase(phase);
  `uvm_info(get_type_name(),"In Build Phase ...",UVM_NONE)
  if(!uvm_config_db#(virtual adder_interface)::get(this, "", "vif", vif)) begin
    `uvm_fatal("NO_MON_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  end
endfunction

task adder_monitor::run_phase(uvm_phase phase);
  super.run_phase(phase);
  `uvm_info(get_type_name(),"In Run Phase ...",UVM_NONE)

  forever begin
    rx = adder_seq_item::type_id::create("rx",this);
    @(posedge vif.clk);

    rx.in1 = vif.in1;
    rx.in2 = vif.in2;
    rx.out = vif.out;
    rx.reset = vif.reset;

    `uvm_info(get_type_name(), $sformatf("Printing Transaction %s",rx.convert2string()), UVM_MEDIUM);
    mon_aport.write(rx);
  end
endtask
```