set LIB_NAME "rf_2p_hse_ccs_tt_0p90v_0p90v_25c"
set LIB "../sram/${LIB_NAME}_syn.lib"
set DB "../sram/${LIB_NAME}.db"

read_lib ${LIB}
write_lib ${LIB_NAME} -format db -output ${DB}
exit