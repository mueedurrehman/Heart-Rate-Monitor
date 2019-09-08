transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/logical.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/four_to_one_mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/lab4dram.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/hex_to_seven_seg.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/two_to_one_mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/var_clk.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/signExtend.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/shifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/lab4.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/control.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/halt_logic.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/cpu.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/registerFile.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/lab4_top.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/dual_reg_in.v}
vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/lab4iram1g.v}

vlog -vlog01compat -work work +incdir+C:/Users/ericx/OneDrive/Desktop/ECE\ 2300/Lab\ 4/lab4PrelabCase/lab4 {C:/Users/ericx/OneDrive/Desktop/ECE 2300/Lab 4/lab4PrelabCase/lab4/lab4_test.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  lab4_test

add wave *
view structure
view signals
run -all
