#NoEnv
SendMode Input
DetectHiddenWindows On
DetectHiddenText, On
CoordMode, Pixel, Screen
SetWorkingDir %A_ScriptDir%

Gui, Add, ListView, r10 , log
gui, add, button,y+5,start
gui, show,,Macro

main:
	

gerji:=0
Loop   ;���� ����
{
LV_Insert(1,,"������Դϴ�." gerji)
;����ȭ�鿡�� ����ȭ������
err := SearchAndClick(582, 369, 3, 519, 330, 640, 409, 80, "main.png", 12, 42, 82, 86, "return.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep2(1000)
;����->��޼���
err := SearchAndClick(692, 149, 2, 12, 42, 82, 86, 80, "return.png", 565, 87, 701, 131, "emergency.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(1000)
;���->4-3e
err := SearchAndClick(567, 358, 7, 565, 87, 701, 131, 80, "emergency.png", 419, 392, 511, 431, "normal.png")
if(err=0) {
	MsgBox ERROR!!
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
		MsgBox Full!!
		break
	}
	sleep(1800)
	if(A_Index>10){
		MsgBox ERROR!!
	}
}
sleep(1000)
;������ġ->1�����ġ
err := SearchAndClick(137, 277, 3, 94, 42, 155, 83, 80, "field.png", 679, 429, 783, 468, "arrange.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep2(1000)
;��ġâ->1���� ��ġ�Ϸ�
err := SearchAndClick(733, 451, 5, 679, 429, 783, 468, 80, "arrange.png", 94, 42, 155, 83, "field.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep2(1000)
;������ġ->2�����ġ
err := SearchAndClick(680, 355, 3, 94, 42, 155, 83, 80, "field.png", 679, 429, 783, 468, "arrange.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep2(1000)

;��� ����
if(Mod(gerji,10)=8){
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
	sleep(1000)
}

;��ġâ->2���� ��ġ�Ϸ�
err := SearchAndClick(733, 451, 5, 679, 429, 783, 468, 80, "arrange.png", 94, 42, 155, 83, "field.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(1400)
;��������
nClick(712,472,8)
sleep2(3300)
;���ֺ�Ŭ��
nClick(135,279,3)
sleep2(1200)
err := SearchAndClick(137, 277, 3, 94, 42, 155, 83, 80, "field.png", 707, 371, 792, 415, "supply.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep2(1600)
;����Ŭ��
err := SearchAndClick(743, 390, 4, 707, 371, 792, 415, 80, "supply.png", 94, 42, 155, 83, "field.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(1100)

;2����Ŭ��
err := SearchAndClick(680, 355, 3, 94, 42, 155, 83, 80, "field.png", 530, 327, 608, 374, "2pclicked.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep2(400)

;���� �̵� ���������� ��ٸ�
nClick(668,256,3)
sleep2(19000)
battlecount := 0
loop{
	find:=nSearch(94, 42, 155, 83, 80, "field.png")
	if(find=1){
		sleep(800)
		break
	}
	nClick(360,264,20)
	sleep(1000)
	if(battelcount>30){
		MsgBox ERROR!!
	}
	battlecount := battlecount+1
}

;2����Ŭ��2
err := SearchAndClick(670, 275, 3, 94, 42, 155, 83, 80, "field.png", 583, 213, 659, 278, "2pclicked2.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep2(400)
;���� �̵� ���������� ��ٸ�
nClick(706,177,2)
sleep2(19000)
battlecount := 0
loop{
	find:=nSearch(94, 42, 155, 83, 80, "field.png")
	if(find=1){
		sleep(600)
		break
	}
	nClick(360,264,30)
	sleep(1000)
	if(battelcount>30){
		MsgBox ERROR!!
	}
	battlecount := battlecount+1
}

;������ �巹��
count:=1
loop{
	Random,numx1,1,5
	Random,numx2,1,5
	Random,numy1,1,5
	Random,numy2,1,5
	
	nDrag(200+50*numx1,120+18*numy1,215+50*numx2,355+18*numy2,10)
	sleep(1000)
	if(nSearch(434, 44, 541, 140, 80, "fieldtop.png")=1 and count>1) {
		break
	}
	if(count>5){
		MsgBox ERROR!!
	}
	count++
}



;2����Ŭ��3
err := SearchAndClick(702, 416, 4, 94, 42, 155, 83, 80, "field.png", 561, 380, 650, 423, "2pclicked3.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(300)
;���� �̵� ���������� ��ٸ�
nClick(648,314,3)

sleep(19000)
/*

Random,ran,1,20
if(ran=19){
	LV_Insert(1,,"70~150�� �����")
	sleep2(50000)
}else if(ran>1 and ran<18){
	LV_Insert(1,,"14~28�� �����")
	sleep2(19000)
}else{
	LV_Insert(1,,"30~60�� �����")
	sleep2(26000)
}
*/

battlecount := 0
loop{
	find:=nSearch(94, 42, 155, 83, 80, "field.png")
	if(find=1){
		sleep(600)
		break
	}
	nClick(360,264,30)
	sleep(900)
	if(battelcount>30){
		MsgBox ERROR!!
	}
	battlecount := battlecount+1
}

;2����Ŭ��4
err := SearchAndClick(647, 316, 3, 94, 42, 155, 83, 80, "field.png", 544, 269, 621, 332, "2pclicked4.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(300)
;���� �̵� ���������� ��ٸ�
nClick(658,176,4)
sleep(18000)
battlecount := 0
loop{
	find:=nSearch(94, 42, 155, 83, 80, "field.png")
	if(find=1){
		sleep(600)
		break
	}
	nClick(360,264,20)
	sleep2(800)
	if(battelcount>30){
		MsgBox ERROR!!
	}
	battlecount := battlecount+1
}

;������
nClick(736, 479, 6)
sleep(7000)
battlecount := 0
loop{
	if(nSearch(519, 330, 640, 409, 80, "main.png")=1){
		sleep(2000)
		if(nSearch(519, 330, 640, 409, 80, "main.png")=1){
			break
		}
	}else if(nSearch(764, 22, 810, 65, 80, "gunsuend.png")=1){
		nClick(285,263,30)
	}else if(nSearch(450, 336, 520, 383, 80, "gunsustart.png")=1){
		sleep(1000)
		nClick(474,361,4)
	}else if(nSearch(107,60, 209, 123, 80, "friend.png")=1 or nSearch(107,60, 209, 123, 80, "friend2.png")=1){
		sleep(400)
		nClick(148,92,3)
		sleep2(1300)
		nClick(46,58,4)
	}else{
		nClick(736, 479, 6)
	}
	sleep(1300)
	if(battelcount>20){
		MsgBox ERROR!!
	}
	battlecount := battlecount+1
}

;���ο��� ������
err := SearchAndClick(727, 344, 6, 519, 330, 640, 409, 80, "main.png", 17, 38, 86, 93, "return2.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(1000)

;1���� �ɸ��� ����
err := SearchAndClick(149, 283, 5, 17, 38, 86, 93, 80, "return2.png", 12, 42, 82, 86, "cancel.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(1500)

;��ü ĳ���� ����
if(nSearch(211, 414, 281,496, 80, "leader1.png",5)=1 or nSearch(211, 414, 281,496, 80, "leader1_2.png",5)=1){
	x2:=286
	y2:=380
	x:=397
	y:=387
}else{
	x2:=397
	y2:=387
	x:=286
	y:=380
}
err := SearchAndClick(x, y, 6, 12, 42, 82, 86, 80, "cancel.png", 17, 38, 86, 93, "return2.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(1300)

;�� ���� 1->2
err := SearchAndClick(35, 181, 3, 17, 38, 86, 93, 80, "return2.png", 239, 220, 284, 267, "selectdoll.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(1300)

;ĳ������â����
err := SearchAndClick(266, 262, 6, 239, 220, 284, 267, 80, "selectdoll.png", 12, 42, 82, 86, "cancel.png")
if(err=0) {
	MsgBox ERROR!!
}
sleep(1300)

;��ü ��� ĳ���� ����
err := SearchAndClick(x2, y2, 6, 12, 42, 82, 86, 80, "cancel.png", 17, 38, 86, 93, "return2.png")
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
	}else{
		nClick(57, 69, 4)
	}
	sleep(1800)
}
	
gerji := gerji+1


}

return

^!z::ExitApp
^!x::Pause
MButton::pause

/*
search func
*/




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
	Random,ran,0.8,3.2
	multiple:=0.9
	sleep, delay*ran*multiple
	return
}

sleep2(delay:=1000){
	Random,ran,0.9,1.6
	multiple:=0.9
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
	stage:=1
	count:=1
	loop{
		if(Mod(stage,2)=1){
			ImageSearch, , ,x1,y1,x2,y2, *TransBlack *%dp% %A_ScriptDir%\image\%img%
			if(ErrorLevel=2){
				LV_Insert(1,,img "������ ã�� �� �����ϴ�.")
			}else if(Errorlevel=1){
				if(count>5){
					LV_Insert(1,,img "�� �����ϴ�. ")
					count:=1
					stage:=stage+1
				}else{
					LV_Insert(1,,"���� ȭ�鿡" img "��(��) �����ϴ�. �����.." count)
					sleep(700)
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
				if(count>5){
					LV_Insert(1,,img2 "�� �����ϴ�. ��õ� �մϴ�.")
					count:=1
					stage:=stage+1
				}else{
					LV_Insert(1,,"���� ȭ�鿡" img2 "��(��) �����ϴ�. �����.." count)
					sleep(700)
					count := count+1
				}
			}else{
				LV_Insert(1,,img2 "��(��) ã�ҽ��ϴ�. click ����")
				return 1
			}
		}
		if(stage>10){
			LV_Insert(1,,"���� �̹����� �� �� ã�� �� �����ϴ�")
			return 0
		}
		sleep2(400)
	}
}

SearchAndClickAndSplit(xClick, yClick, range, x1, y1, x2, y2, dp:=80, img:=" ", x21:=0, y21:=0, x22:=0, y22:=0, img2:=" ")
{
	stage:=1
	count:=1
	loop{
		if(Mod(stage,2)=1){
			ImageSearch, , ,x1,y1,x2,y2, *TransBlack *%dp% %A_ScriptDir%\image\%img%
			if(ErrorLevel=2){
				LV_Insert(1,,img "������ ã�� �� �����ϴ�.")
			}else if(Errorlevel=1){
				if(count>5){
					LV_Insert(1,,img "�� �����ϴ�. ")
					count:=1
					stage:=stage+1
				}else{
					LV_Insert(1,,"���� ȭ�鿡" img "��(��) �����ϴ�. �����.." count)
					sleep(700)
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
				if(count>5){
					LV_Insert(1,,img2 "�� �����ϴ�. ��õ� �մϴ�.")
					count:=1
					stage:=stage+1
				}else{
					LV_Insert(1,,"���� ȭ�鿡" img2 "��(��) �����ϴ�. �����.." count)
					sleep(700)
					count := count+1
				}
			}else{
				LV_Insert(1,,img2 "��(��) ã�ҽ��ϴ�. click ����")
				return 1
			}
		}
		if(stage>10){
			LV_Insert(1,,"���� �̹����� �� �� ã�� �� �����ϴ�")
			return 0
		}
		sleep2(400)
	}
}