
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Lab4 -dir "C:/Users/ASUS/Desktop/FPGA-LAB_LAB04_Wed-G_Report/Lab4/Lab4/planAhead_run_1" -part xc6slx45csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "DUT.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ComplexMultiplier.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top ComplexMultiplier $srcset
add_files [list {DUT.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/CORDIC.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/MultAdd1.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/MultAdd2.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/MultAdd3.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx45csg324-3
