if [file exists "work"] {adel -all}
alib work
alog -f sv.f 
asim  -voptargs="+acc" top
run -all
if {[batch_mode]}	{
	quit
}