###################################################################
set PERIOD  10.0
set RESET_DELAY  0.85
set INPUT_DELAY  1.0
set OUTPUT_DELAY  1.0
set CLOCK_LATENCY 0.4       
set MIN_IO_DELAY 1.0
set MAX_TRANSITION 0.5

#reference library cells
set REFLIB "saed90nm_typ_ht_pg.db:saed90nm_typ_ht_pg"
set BUFFER "NBUFFX16"
set SDFF  "SDFFARX1"
set BUF_IN_PIN "IN"
set BUF_OUT_PIN "Q"
set WIRELOAD_LIB_NAME "saed90nm_typ_ht.db:saed90nm_typ_ht"
echo "===============initials finishes============"

###################################################################
#set sdc_version 1.8
#set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA


###################################################
## CLOCK BASICS

echo "===============Clock basics finishes============"
#################################################################
## GROUPING

group_path  -name INPUTS\
            -through [all_inputs]\
            -weight 1

group_path  -name OUTPUTS\
            -to [all_outputs]\
            -weight 1
#################################################################			
## IN/OUT
set INPUTPORTS [all_inputs]
set OUTPUTPORTS [all_outputs]

		 

set_wire_load_model -lib $WIRELOAD_LIB_NAME -name "ForQA"
set_load -pin_load [expr 5 * [load_of $REFLIB/$BUFFER/$BUF_IN_PIN]] [all_outputs]
#set_load -pin_load 0.004 $OUTPUTPORTS


echo "===============IO finishes============"
#################################################################
## Area
set_max_area  13000
echo "===============Area finishes============"
#################################################################	
## DRC
set_max_transition $MAX_TRANSITION [current_design]
set_max_fanout 20 [current_design]
echo "===============All finishes============"
