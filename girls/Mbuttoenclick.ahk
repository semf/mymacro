#NoEnv
SendMode Input
DetectHiddenWindows On
DetectHiddenText, On
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

MouseClick, M, 534, 322 ,,,D
sleep(200)
MouseClick, M, 534, 322 ,,,U
ExitApp


sleep(delay:=1000){
	Random,ran,0.9,3.2
	multiple:=1.0
	sleep, delay*ran*multiple
	return
}