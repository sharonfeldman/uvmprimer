if [file exists "work"] {adel -all}
alib work

# Comment out either the SystemVerilog or VHDL DUT.
# There can be only one!

#VHDL DUT
acom -dbg -coverage sbecam -F dut.f

# SystemVerilog DUT
#vlog ../misc/tinyalu.sv

alog -dbg +accb -coverage sbecam -O0 -sv2k9 tinyalu_tb.sv
#asim top_optimized -coverage
asim -acdb -acdb_cov sbfectam +access +r+m+tinyalu.rtl -exc control  top

set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all

acdb save -cov sbfecta -file tinyalu.acdb

acdb exclude -db tinyalu.acdb  -file tinyalu_dut/single_cycle_add_and_xor.vhd:49 -cov sb -comment "was excluded"
acdb report -cov sbfea -html -o tinyalu.html -db tinyalu.acdb
acdb report -cov sbfea -html -o tinyalu_coverd.html -db tinyalu.acdb -covered
acdb report -cov sbfea -html -o tinyalu_uncoverd.html -db tinyalu.acdb -uncovered
acdb report -cov sbfea -html -o tinyalu_excluded.html -db tinyalu.acdb -excluded
quit
