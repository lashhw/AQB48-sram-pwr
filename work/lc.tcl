#set LIB_NAME "rf_2p_hse_ccs_tt_0p90v_0p90v_25c"
set LIB_NAME "sram_dp_hde_ccs_tt_0p90v_0p90v_25c"
set LIB "/tmp/${LIB_NAME}_syn.lib"
set DB "/tmp/${LIB_NAME}.db"

read_lib ${LIB}
write_lib ${LIB_NAME} -format db -output ${DB}
exit