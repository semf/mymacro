#NoEnv
SendMode Input
DetectHiddenWindows On
DetectHiddenText, On
CoordMode, Pixel, Screen
SetWorkingDir %A_ScriptDir%

Gui, Add, ListView, r10 , log
gui, show,,Macro

Loop, read,  %A_ScriptDir%\02setting.txt
{
	StringSplit, arr, A_LoopReadLine, %A_Space%
	if(A_Index=1){
		FirstDealer:=arr2
	}else if(A_Index=2){
		SecondDealer:=arr2
	}else if(A_Index=3){
		cure:=arr2
	}
}

main:

cureTag:=0
Loop   ;���� ����
{
;����ȭ�鿡�� ����ȭ������
err := SearchAndClick(582, 369, 3, 519, 330, 640, 409, 80, "main.png", 12, 42, 82, 86, "return.png")
if(err=0) {
	loop,3 {
		nClick(474,361,4)
		sleep(500)
		err := SearchAndClick(582, 369, 3, 519, 330, 640, 409, 80, "main.png", 12, 42, 82, 86, "return.png")
		if(err!=0){
			break
		}
	}
}
sleep2(1000)
;02����
err := SearchAndClick(502, 279, 7, 12, 42, 82, 86, 80, "return.png", 419, 392, 511, 431, "normal.png")
if(err=0) {
	loop,3 {
		nClick(474,361,4)
		sleep(500)
		err := SearchAndClick(502, 279, 7, 12, 42, 82, 86, 80, "return.png", 419, 392, 511, 431, "normal.png")
		if(err!=0){
			break
		}
	}
}
sleep(500)
;������ġ->���弳��  or ĳ���� �������
loop{
	if(nSearch(419, 392, 511, 431, 80, "normal.png")=1){
		nclick(471,417,4)
	}else if(nSearch(94, 42, 155, 83, 80, "field.png")=1){
		break
	}else if(nSearch(335, 341, 460, 405, 80, "full.png")=1){
		sleep(1000)
		nClick(406,378,6)
		sleep(700)
		nClick(147,109,5)
		sleep(800)
		nClick(52,68,6)
		;����ȭ�鿡�� ���
		loop{
			if(nSearch(764, 22, 810, 65, 80, "gunsuend.png")=1){
				nClick(285,263,30)
			}else if(nSearch(450, 336, 520, 383, 80, "gunsustart.png")=1){
				sleep(1000)
				nClick(474,361,4)
			}else if(nSearch(107,60, 209, 123, 80, "friend.png")=1 or nSearch(107,60, 209, 123, 80, "friend2.png")=1){
				sleep(400)
				nClick(148,92,3)
				sleep2(1300)
				nClick(46,58,4)
			}else if(nSearch(247, 132,318,178, 80, "share.png")=1){
				sleep(800)
				nClick(172,146,3)
				sleep(700)
				nClick(219,266,8)
				sleep(300)
			}
			LV_Delete()
			LV_Insert(1,,"ĳ����â�� ����á���ϴ�.")
			sleep(5000)
		}
	}else if(nSearch(764, 22, 810, 65, 80, "gunsuend.png")=1){
		nClick(285,263,30)
	}else if(nSearch(450, 336, 520, 383, 80, "gunsustart.png")=1){
		sleep(1000)
		nClick(474,361,4)
	}
	sleep(1100)
	if(A_Index>10){
		MsgBox ERROR!!
	}
}

sleep(300)
;������ġ->1�����ġ
err := SearchAndClick(169, 274, 3, 94, 42, 155, 83, 80, "field.png", 679, 429, 783, 468, "arrange.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep2(400)
;��ġâ->1���� ��ġ�Ϸ�
err := SearchAndClick(733, 451, 5, 679, 429, 783, 468, 80, "arrange.png", 94, 42, 155, 83, "field.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep2(400)
;������ġ->2�����ġ
err := SearchAndClick(411, 277, 3, 94, 42, 155, 83, 80, "field.png", 679, 429, 783, 468, "arrange.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep2(400)

;��� ����
if(cureTag=cure){
	;����â
	err := SearchAndClick(391,271, 5, 679, 429, 783, 468, 80, "arrange.png", 526, 345, 631, 387, "healing.png")
	if(err=0) {
		MsgBox ERROR!!
	}
	sleep(700)
	;Ȯ��
	err := SearchAndClick(583, 365, 4, 526, 345, 631, 387, 80, "healing.png", 679, 429, 783, 468, "arrange.png")
	if(err=0) {
		MsgBox ERROR!!
	}
	cureTag:=0
	sleep(400)
}

;��ġâ->2���� ��ġ�Ϸ�
err := SearchAndClick(733, 451, 5, 679, 429, 783, 468, 80, "arrange.png", 94, 42, 155, 83, "field.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(400)
;��������
nClick(712,472,8)
sleep2(3300)
;�ڷ���ƮŬ��
nClick(165, 272,3)
sleep2(600)
err := SearchAndClick(165, 272, 3, 94, 42, 155, 83, 80, "field.png", 707, 371, 792, 415, "supply.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep2(600)
;����Ŭ��
err := SearchAndClick(743, 390, 4, 707, 371, 792, 415, 80, "supply.png", 94, 42, 155, 83, "field.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(600)

;2����Ŭ��
err := SearchAndClick(411, 278, 5, 94, 42, 155, 83, 80, "field.png", 567, 211, 659, 302, "02clicked.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep2(400)

;���� �̵� ���������� ��ٸ�
nClick(310,213,3)
battleend_to_main()

;2����Ŭ��2
err := SearchAndClick(313, 215, 3, 94, 42, 155, 83, 80, "field.png", 566, 175, 655, 233, "02clicked2.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep2(400)
;���� �̵� ���������� ��ٸ�
nClick(339,90,2)
battleend_to_main()

;������ �巹��
count:=1
loop{
	Random,numx1,1,5
	Random,numx2,1,5
	Random,numy1,1,5
	Random,numy2,1,5
	
	nDrag(430+30*numx1,120+8*numy1,430+30*numx2,370+10*numy2,6)
	if(count>1){
		sleep(1000)
	}
	if(nSearch(430, 53, 513, 126, 80, "02fieldtop.png")=1 and count>1) {
		break
	}
	if(count>5){
		MsgBox ERROR!!
	}
	count++
}

;2����Ŭ��3
err := SearchAndClick(334, 388, 4, 94, 42, 155, 83, 80, "field.png", 462, 345, 544, 408, "02clicked3.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(300)

;2�����ĭ���� �̵�
err := SearchAndClick(423, 257, 4, 462, 345, 544, 408, 80, "02clicked3.png", 132, 215, 205, 277, "02clicked4.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(900)

;�����̵� 
nClick(329,194,3)
sleep(1800)
nClick(329,194,4)
battleend_to_main()

;������
nClick(739,477,4)
sleep2(8000)

;2����Ŭ��5
err := SearchAndClick(326, 198, 3, 94, 42, 155, 83, 80, "field.png", 130, 155, 215, 215, "02clicked5.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(300)

;���� �̵� ���������� ��ٸ�
nClick(507,190,4)
battleend_to_main()


;2����Ŭ��6
err := SearchAndClick(508, 194, 3, 94, 42, 155, 83, 80, "field.png", 139, 150, 212, 215, "02clicked6.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(300)

;���� �̵� ���������� ��ٸ�
nClick(626,218,5)
battleend_to_main()


if(nSearch(561,134,626,205,80, "02warning.png",5)=1){
	cureTag:=cure-1
}

;������
nClick(736, 479, 6)
sleep(3500)
loop{
	if(nSearch(519, 330, 640, 409, 80, "main.png")=1){
		sleep(1400)
		if(nSearch(519, 330, 640, 409, 80, "main.png")=1){
			break
		}
	}else if(nSearch(764, 22, 810, 65, 80, "gunsuend.png")=1){
		nClick(285,263,30)
	}else if(nSearch(450, 336, 520, 383, 80, "gunsustart.png")=1){
		sleep(500)
		nClick(474,361,4)
	}else if(nSearch(107,60, 209, 123, 80, "friend.png")=1 or nSearch(107,60, 209, 123, 80, "friend2.png")=1){
		sleep(400)
		nClick(148,92,3)
		sleep2(1300)
		nClick(46,58,4)
	}else if(nSearch(247, 132,318,178, 80, "share.png")=1){
		sleep(800)
		nClick(172,146,3)
		sleep(700)
		nClick(219,266,8)
		sleep(300)
	}else{
		if(A_Index<3){
			nClick(736, 479, 6)
		}else{
			nClick(246,234,10)
		}
	}
	sleep(1000)
	if(A_Index>20){
		MsgBox ERROR!!
	}
}

changecharacter(FirstDealer,SecondDealer)

LV_Delete()
LV_Insert(1,,A_Index "ȸ �Ϸ� �Ͽ����ϴ�")
	
cureTag:=cureTag+1


}

return

^!z::ExitApp
^!x::Pause
MButton::pause



nClick(x, y,range)
{
	Random,rX,-5*range,5*range
	Random,rY,-3*range,3*range
	x:=x+rX
	y:=y+rY
	IParam := x|y<<16 
	WinGet, ActiveID, ID, dstn
	PostMessage, 0x201, 1, %IParam%, , ahk_id %ActiveID%
	sleep2(200)
	PostMessage, 0x202, 0, %IParam%, , ahk_id %ActiveID%
	sleep,50
}

nDrag(x1,y1,x2,y2,range)
{
	Random,rX,-5*range,5*range
	Random,rY,-3*range,3*range
	x1:=x1+rX
	y1:=y1+rY
	Random,rX,-5*range,5*range
	Random,rY,-3*range,3*range
	x2:=x2+rX
	y2:=y2+rY
	Random,num,15,22
	Random,num2,28,34
	IParam := x1|y1<<16
	WinGet, ActiveID, ID, dstn
	PostMessage, 0x201, 1, %IParam%, , ahk_id %ActiveID%
	sleep(50)
	gapx:=(x2-x1)/num2
	gapy:=(y2-y1)/num2
	loop,31
	{
		sleep(num/1.4)
		y1:=y1+gapy
		x1:=x1+gapx
		IParam := Ceil(x1)|Ceil(y1)<<16
		PostMessage, 0x200, 1, %IParam%, , ahk_id %ActiveID%
	}
	PostMessage, 0x202, 0, %IParam%, , ahk_id %ActiveID%
	sleep,200
}

sleep(delay:=1000){
	Random,ran,1.1,3.2
	multiple:=1.0
	sleep, delay*ran*multiple
	return
}

sleep2(delay:=1000){
	Random,ran,1.3,1.6
	multiple:=1.0
	sleep, delay*ran*multiple
	return
}

ransleep(delay){
	Random,ran,1,30
	if(ran=1){
		LV_Insert(1,,"120~240�� �����")
		sleep(delay*60)
	}else if(ran>1 and ran<25){
		sleep(delay)
	}else {
		LV_Insert(1,,"��30�� �����")
		sleep(delay*11)
	}
}

nSearch(x1,y1,x2:=0,y2:=0,dp:=80,img:=" ",count:=1)
{
	x1:=x1-1920
	x2:=x2-1920
	if(x2=0 and y2=0){
		x2:=x1+70
		y2:=y1+70
	}
	loop, %count%{
		ImageSearch, , ,x1,y1,x2,y2, *TransBlack *%dp% %A_ScriptDir%\image\%img%
		if(ErrorLevel=2){
			LV_Insert(1,,img "������ ã�� �� �����ϴ�.")
		}else if(Errorlevel=1){
			LV_Insert(1,,"���� ȭ�鿡" img "��(��) �����ϴ�.")
		}else{
			LV_Insert(1,,img "��(��) ã�ҽ��ϴ�.")
			return 1
		}
		if(count>1){
			sleep,100
		}
	}
	return 0
}

SearchAndClick(xClick, yClick, range, x1, y1, x2, y2, dp:=80, img:=" ", x21:=0, y21:=0, x22:=0, y22:=0, img2:=" ")
{
	x1:=x1-1920
	x2:=x2-1920
	x21:=x21-1920
	x22:=x22-1920
	stage:=1
	count:=1
	loop{
		if(Mod(stage,2)=1){
			ImageSearch, , ,x1,y1,x2,y2, *TransBlack *%dp% %A_ScriptDir%\image\%img%
			if(ErrorLevel=2){
				LV_Insert(1,,img "������ ã�� �� �����ϴ�.")
			}else if(Errorlevel=1){
				if(count>4){
					LV_Insert(1,,img "�� �����ϴ�. ")
					count:=1
					stage:=stage+1
				}else{
					LV_Insert(1,,"���� ȭ�鿡" img "��(��) �����ϴ�. �����.." count)
					sleep(400)
					count := count+1
				}
			}else{
				LV_Insert(1,,img "��(��) ã�ҽ��ϴ�.")
				count := 1
				nClick(xClick, yClick, range)
				stage:=stage+1
			}
		}else if(Mod(stage,2)=0){
			ImageSearch, , ,x21,y21,x22,y22, *TransBlack *%dp% %A_ScriptDir%\image\%img2%
			if(ErrorLevel=2){
				LV_Insert(1,,img2 "������ ã�� �� �����ϴ�.")
			}else if(Errorlevel=1){
				if(count>4){
					LV_Insert(1,,img2 "�� �����ϴ�. ��õ� �մϴ�.")
					count:=1
					stage:=stage+1
				}else{
					LV_Insert(1,,"���� ȭ�鿡" img2 "��(��) �����ϴ�. �����.." count)
					sleep(400)
					count := count+1
				}
			}else{
				LV_Insert(1,,img2 "��(��) ã�ҽ��ϴ�. click ����")
				return 1
			}
		}
		if(stage>12){
			LV_Insert(1,,"���� �̹����� �� �� ã�� �� �����ϴ�")
			return 0
		}
		sleep2(100)
	}
}

battleend_to_main(){
	battleend:=0
	loop{
		if(battleend=1 and nSearch(94, 42, 155, 83, 80, "field.png")=1){
			sleep(600)
			return
		}else if(battleend=0 and nSearch(598, 320, 673, 370, 60, "srank.png")=1){
			Random,ran,1,60
			if(ran=36){
				LV_Insert(1,,"���� �� 1�д��")
				sleep(40000)
			}else if(ran>1 and ran<54){
				LV_Insert(1,,"������ 1�ʴ��")
				sleep(800)
			}else{
				LV_Insert(1,,"���� �� 10�� ���")
				sleep2(9000)
			}
			battleend:=1
		}else if(battleend=0 and nSearch(388,30, 423, 61, 80, "ingameplay.png")=1){
			nClick(400,36,3)
		}
		if(battleend=1){
			nClick(360,264,30)
		}
		sleep(900)
		if(A_Index>300){
			MsgBox ERROR!!
		}
	}
}

selectposx(pos){
	return mod(pos,6)*112+56
}

selectposy(pos){
	if(pos>0 and pos<12){
		return Floor(pos/6)*200+187
	}else if(pos>11 and pos<18){
		return 498
	}else{
		MsgBox setting error
	}
}

changecharacter(First,Second){
	fx:=selectposx(First)
	fy:=selectposy(First)
	sx:=selectposx(Second)
	sy:=selectposy(Second)
	;���ο��� ������
	err := SearchAndClick(727, 344, 6, 519, 330, 640, 409, 80, "main.png", 17, 38, 86, 93, "return2.png")
	if(err=0) {
		MsgBox ERROR!!
	}
	sleep(400)

	;1���� �ɸ��� ����
	err := SearchAndClick(149, 283, 5, 17, 38, 86, 93, 80, "return2.png", 12, 42, 82, 86, "cancel.png")
	if(err=0) {
		MsgBox ERROR!!
	}
	sleep(600)

	;��ü ĳ���� ����
	if(nSearch(fx-80, fy, fx, fy+120, 80, "leader1.png",3)=1 or nSearch(fx-80, fy, fx, fy+120, 80, "leader1_2.png",3)=1){
		x:=sx
		y:=sy
		x2:=fx
		y2:=fy
	}else{
		x2:=sx
		y2:=sy
		x:=fx
		y:=fy
	}
	err := SearchAndClick(x, y, 3, 12, 42, 82, 86, 80, "cancel.png", 17, 38, 86, 93, "return2.png")
	if(err=0) {
		MsgBox ERROR!!
	}
	sleep(400)

	;�� ���� 1->2
	err := SearchAndClick(35, 181, 3, 17, 38, 86, 93, 80, "return2.png", 239, 220, 284, 267, "selectdoll.png")
	if(err=0) {
		MsgBox ERROR!!
	}
	sleep(400)

	;ĳ������â����
	err := SearchAndClick(266, 262, 6, 239, 220, 284, 267, 80, "selectdoll.png", 12, 42, 82, 86, "cancel.png")
	if(err=0) {
		MsgBox ERROR!!
	}
	sleep(400)

	;��ü ��� ĳ���� ����
	err := SearchAndClick(x2, y2, 3, 12, 42, 82, 86, 80, "cancel.png", 17, 38, 86, 93, "return2.png")
	if(err=0) {
		MsgBox ERROR!!
	}
	sleep(1000)

	;����ȭ������
	nClick(57, 69, 8)
	sleep(3000)
	loop{
		if(nSearch(519, 330, 640, 409, 80, "main.png")=1){
			sleep(2300)
			if(nSearch(519, 330, 640, 409, 80, "main.png")=1){
				break
			}
		}else if(nSearch(764, 22, 810, 65, 80, "gunsuend.png")=1){
			nClick(285,263,30)
		}else if(nSearch(450, 336, 520, 383, 80, "gunsustart.png")=1){
			sleep(1000)
			nClick(474,361,4)
		}else if(nSearch(247, 132,318,178, 80, "share.png")=1){
			sleep(800)
			nClick(172,146,3)
			sleep(700)
			nClick(219,266,8)
			sleep(300)
		}else{
			nClick(57, 69, 4)
		}
		if(A_Index>30){
			MsgBox error!
		}
		sleep(1600)
	}
	return
}