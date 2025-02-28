//(0) Create a class extending from uvm_sequence_item
//(1) Register class with Factory
//(2) Declare transaction varaiable
//(3) Construct the created class with new()
//(4) Add constraints [if any]
class adder_seq_item extends uvm_sequence_item;

`uvm_object_utils(adder_seq_item)

rand bit reset; 
rand bit [7:0] in1;
rand bit [7:0] in2; 
bit [8:0] out;

extern function new( string name = "adder_seq_item");
//extern constraint WRITE_YOUR_OWN_CONSTRAINT;
extern function string input2string();
extern function string output2string();
extern function string convert2string();

endclass //adder_seq_item

function adder_seq_item::new( string name = "adder_seq_item");
 super.new( name );
endfunction : new

//constraint adder_seq_item::WRITE_YOUR_OWN_CONSTRAINT{ a!= b; };

function string adder_seq_item::input2string();
 return $sformatf("in1=%0h,in2=%0h",in1,in2);
endfunction : input2string

function string adder_seq_item::output2string();
 return $sformatf(" out=%0h", out);
endfunction : output2string

function string adder_seq_item::convert2string();
 return ({input2string(), " ", output2string()});
endfunction : convert2string