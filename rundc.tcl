echo "***************   Begin run DC setup    ***************"
echo ""
echo ""
echo "***************   Begin     lib setup    ***************"
echo ""
echo ""
source /home/wyx/Desktop/CNN/Script/DC/lib_set.tcl 
echo ""
echo ""
echo "***************   finish  lib setup      ***************"
echo ""
echo ""
echo "***************   Begin Read Verilog     ***************"
set TOP_DESIGN_NAME CONV_ACC
set verilog_list [list \
/home/wyx/Desktop/CNN/Input/verilog/CONV_ACC.v \
/home/wyx/Desktop/CNN/Input/verilog/IFM_BUF.v \
/home/wyx/Desktop/CNN/Input/verilog/PE.v \
/home/wyx/Desktop/CNN/Input/verilog/PE_FSM.v \
/home/wyx/Desktop/CNN/Input/verilog/PSUM_ADD.v \
/home/wyx/Desktop/CNN/Input/verilog/PSUM_BUFF.v \
/home/wyx/Desktop/CNN/Input/verilog/SYNCH_FIFO.v \
/home/wyx/Desktop/CNN/Input/verilog/WGT_BUF.v \
/home/wyx/Desktop/CNN/Input/verilog/WRITE_BACK.v \
]

#read_file -format verilog $verilog_list

analyze -format verilog $verilog_list
elaborate  $TOP_DESIGN_NAME
current_design $TOP_DESIGN_NAME
uniquify
link 

echo "*************** Read Verilog success    ***************"
echo "top design name is $TOP_DESIGN_NAME"
echo ""
echo "*************** Load SDC file           ***************"
source /home/wyx/Desktop/CNN/Script/DC/sdc.tcl
echo "*************** Load SDC file success   ***************"
echo ""
echo "***********     start flatten compile       ***********"
set_flatten true -effort high
set verilogout_no_tri true
set verilogout_equation false
set_fix_multiple_port_nets -buffer_constants -all

compile_ultra -no_boundary_optimization 

#****************************************************
#  fix_hold_time
#****************************************************
compile -incremental -only_hold_time 


echo "***********       finish      compile        ***********"
echo ""
echo "***************   start save design     ****************"

set reportDir "/home/wyx/Desktop/CNN/DC_OUT/"
write_file -f ddc -hier -output $reportDir/$TOP_DESIGN_NAME.ddc
write -f verilog -hierarchy -output $reportDir/$TOP_DESIGN_NAME.v
write_sdc $reportDir/$TOP_DESIGN_NAME.sdc
write_sdf -context verilog $reportDir/$TOP_DESIGN_NAME.sdf

set reportDir "/home/wyx/Desktop/CNN/DC_OUT/rpt"
echo "DC report was product at $reportDir"
source /home/wyx/Desktop/CNN/Script/DC/report.tcl
             

exit
