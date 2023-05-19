transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/13.1/DASHA {C:/altera/13.1/DASHA/COMPARATOR.v}

vlog -vlog01compat -work work +incdir+C:/altera/13.1/DASHA/simulation/qsim {C:/altera/13.1/DASHA/simulation/qsim/COMPARATOR.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  COMPARATOR_vlg_tst

add wave *
view structure
view signals
run -all
