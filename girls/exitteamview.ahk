#NoEnv
SendMode Input
DetectHiddenWindows On
DetectHiddenText, On
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

SetWorkingDir %A_ScriptDir%



main:
loop
{
ImageSearch, , ,700,470,812,564, *TransBlack *80 %A_ScriptDir%\image\teamview.png
if(ErrorLevel=0){
Click 1136,598
}
sleep,10000
}