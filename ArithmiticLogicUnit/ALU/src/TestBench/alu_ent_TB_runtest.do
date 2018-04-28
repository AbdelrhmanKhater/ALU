SetActiveLib -work
comp -include "$DSN\src\alu.vhd" 
comp -include "$DSN\src\TestBench\alu_ent_TB.vhd" 
asim TESTBENCH_FOR_alu_ent 
wave 
wave -noreg a
wave -noreg b
wave -noreg sel
wave -noreg z
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\alu_ent_TB_tim_cfg.vhd" 
# asim TIMING_FOR_alu_ent 
