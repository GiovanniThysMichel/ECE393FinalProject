echo "************************************************************"
echo "***************   Begin Load dc_lib_setup    ***************"
echo "************************************************************"

set_units -time ns -resistance kOhm -capacitance pF -power mW -voltage V -current mA



set PRJ_ROOT_PATH "/home/wyx/Desktop/CNN/DC"
set RTL_PATH      "/home/wyx/Desktop/CNN/Input/verilog"
set SCRIPT_PATH   "/home/wyx/Desktop/CNN/Script/DC"

# lib set 

set SYMBOL_PATH [list "/home/wyx/smic18/smic.18_standardcell_pdk/smic180/digital/sc/symbols/synopsys"]
set LIB_PATH [list "/home/wyx/smic18/smic.18_standardcell_pdk/smic180/digital/sc/synopsys"]


set_app_var search_path [list  . $search_path \
                                 $LIB_PATH \
				 $SYMBOL_PATH \
				 $RTL_PATH \
				 $SCRIPT_PATH \
				 $PRJ_ROOT_PATH \
			]
set_app_var target_library [list slow.db]
echo "target_library $LIB_PATH"

set_app_var link_library [list * ${target_library} ]
echo "link_library ${target_library}"

set_app_var symbol_library [list smic18.sdb]
echo "symbol_library $SYMBOL_PATH"

#set_app_var synthetic_library {}

echo "************************************************************"
echo "***************   End of Load dc_lib_setup   ***************"
echo "************************************************************"


