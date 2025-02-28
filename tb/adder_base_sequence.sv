class adder_base_sequence extends uvm_sequence#(adder_seq_item);

`uvm_object_utils(adder_base_sequence)
adder_seq_item req;

extern function new( string name = "adder_base_sequence");
extern task body();

endclass //adder_base_sequence

function adder_base_sequence::new(string name = "adder_base_sequence");
 super.new( name );
endfunction : new

task adder_base_sequence::body();
`uvm_info(get_type_name(), $sformatf("Start of adder_base_sequence Sequence"), UVM_LOW)
req = adder_seq_item:: type_id :: create("req");
repeat(5) begin //{
	`uvm_do(req)
end //}
`uvm_info(get_type_name(), $sformatf("End of adder_base_sequence Sequence"), UVM_LOW)

endtask //adder_base_sequence