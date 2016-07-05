if [file exists "work"] {adel -all}
alib work
#alog classes.sv
#alog structs.sv
#alog rectangle_only.sv
alog  -allow_duplicated_units -F sv.f 
asim +accb top_class
run -all
if {[batch_mode]}	{
	quit
}
