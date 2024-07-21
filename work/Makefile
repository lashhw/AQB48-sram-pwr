TECH_SIM=/usr/cad/cell_lib/TN40G/CBDK_TSMC40_Arm_f2.0/CIC/Verilog/sc9_cln40g_base_rvt.v
TECH_SIM_NEG=/usr/cad/cell_lib/TN40G/CBDK_TSMC40_Arm_f2.0/CIC/Verilog/sc9_cln40g_base_rvt_neg.v
TECH_SIM_UDP=/usr/cad/cell_lib/TN40G/CBDK_TSMC40_Arm_f2.0/CIC/Verilog/sc9_cln40g_base_rvt_udp.v
SRAM_SIM=../sram/rf_2p_hse.v
GATE_TOP=tb_rf_2p_hse
ANNOTATE_PATH=/${GATE_TOP}/DUT

error:
	@echo "Please choose one of the following target: lc, syn, gate_sim, pwr"
	@exit 1

lc:
	lc_shell -f lc.tcl -output_log_file lc.log

syn:
	dcnxt_shell -f syn.tcl -output_log_file syn.log

gate_sim:
	vlog -64 -v ${TECH_SIM} -v ${TECH_SIM_NEG} -v ${TECH_SIM_UDP} -v ${SRAM_SIM} gate.v
	vlog -64 ../test/${GATE_TOP}.sv
	vopt -64 +acc=npr+${ANNOTATE_PATH}. -sdftyp ${ANNOTATE_PATH}=gate.sdf ${GATE_TOP} -o tb_opt
	vsim -64 -sdfnoerror -do "power add -r ${ANNOTATE_PATH}/*" tb_opt
	# run the following commands in QuestaSim console
	# run <timesteps>
	# power report -all -bsaif gate.saif

pwr:
	pwr_shell -f pwr.tcl -x "set ANNOTATE_PATH ${ANNOTATE_PATH}" -output_log_file pwr.log

clean:
	rm -rf ../sram/*
	rm -rf transcript work *.wlf etch*
	rm -rf *.svf *.log *.ddc *.v *.sdc *.sdf alib-*
	rm -rf .rce *.fsdb *.saif primetime_px*
