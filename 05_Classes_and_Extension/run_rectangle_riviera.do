if [file exists "work"] {adel -all}
alib work
#alog classes.sv
#alog structs.sv
#alog rectangle_only.sv
alog  -allow_duplicated_units -F sv.f 
asim +accb top_rectangle
run -all
quit
