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
Loop   ;메인 루프
{
LV_Insert(1,,"대기중입니다." gerji)
;전투클릭
nClick(582,370,6)
sleep(3000)
;지역창 드레그
Random,numx1,1,5
Random,numx2,1,5
Random,numy1,1,5
Random,numy2,1,5
nDrag(370+25*numx1,355+18*numy1,380+50*numx2,60+18*numy2,10)
sleep(1000)
;교란수습클릭
nClick(513,407,4)
sleep(800)
;작전배치->일반작전클릭
nClick(471,410,4)
sleep(4000)
;지휘부클릭
nClick(664,363,4)
sleep(1200)
;배치클릭
nClick(731,450,4)
sleep(200)
;위로 드레그
loop,3{
	Random,numx1,1,5
	Random,numx2,1,5
	Random,numy1,1,5
	Random,numy2,1,5
	nDrag(200+50*numx1,100+18*numy1,215+50*numx2,355+18*numy2,10)
}
;헬리포트클릭
nClick(693,135,4)
sleep(1200)
;배치클릭
nClick(731,450,4)
sleep(200)
;작전시작
nClick(718,467,7)
sleep(2000)
;헬리포트클릭
nClick(693,135,4)
sleep(800)
;첫번째 물음표
nClick(681,227,4)
sleep(1400)
;클릭해제 &헬리포트
nClick(667,277,5)
sleep(500)
nClick(620,324,4)
sleep(1400)
;아래좌물음표
nClick(537,386,4)
sleep(1400)
;클릭해제&마지막물음표
nClick(667,277,5)
sleep(500)
nClick(631,423,4)
sleep(1400)
;클릭해제&작전중지
nClick(667,277,5)
sleep(500)
nClick(197,62,6)
sleep(600)
nClick(498,355,5)
sleep(3000)

	
gerji := gerji+1


}

return

z::ExitApp
x::Pause

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
	Random,num,15,25
	Random,num2,28,34
	IParam := x1|y1<<16
	WinGet, ActiveID, ID, dstn
	PostMessage, 0x201, 1, %IParam%, , ahk_id %ActiveID%
	sleep(200)
	gapx:=(x2-x1)/num2
	gapy:=(y2-y1)/num2
	loop,31
	{
		sleep(num)
		y1:=y1+gapy
		x1:=x1+gapx
		IParam := Ceil(x1)|Ceil(y1)<<16
		PostMessage, 0x200, 1, %IParam%, , ahk_id %ActiveID%
	}
	PostMessage, 0x202, 0, %IParam%, , ahk_id %ActiveID%
	sleep,200
}

sleep(delay:=1000){
	Random,ran,1.0,1.8
	multiple:=1.3
	sleep, delay*ran*multiple
	return
}

sleep2(delay:=1000){
	Random,ran,0.9,1.6
	multiple:=1
	sleep, delay*ran*multiple
	return
}

ransleep(delay){
	Random,ran,1,30
	if(ran=1){
		LV_Insert(1,,"120~240초 대기중")
		sleep(delay*60)
	}else if(ran>1 and ran<25){
		sleep(delay)
	}else {
		LV_Insert(1,,"약30초 대기중")
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
			LV_Insert(1,,img "파일을 찾을 수 없습니다.")
		}else if(Errorlevel=1){
			LV_Insert(1,,"현재 화면에" img "이(가) 없습니다.")
		}else{
			LV_Insert(1,,img "을(를) 찾았습니다.")
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
				LV_Insert(1,,img "파일을 찾을 수 없습니다.")
			}else if(Errorlevel=1){
				if(count>5){
					LV_Insert(1,,img "가 없습니다. ")
					count:=1
					stage:=stage+1
				}else{
					LV_Insert(1,,"현재 화면에" img "이(가) 없습니다. 대기중.." count)
					sleep(700)
					count := count+1
				}
			}else{
				LV_Insert(1,,img "을(를) 찾았습니다.")
				count := 1
				nClick(xClick, yClick, range)
				stage:=stage+1
			}
		}else if(Mod(stage,2)=0){
			ImageSearch, , ,x21,y21,x22,y22, *TransBlack *%dp% %A_ScriptDir%\image\%img2%
			if(ErrorLevel=2){
				LV_Insert(1,,img2 "파일을 찾을 수 없습니다.")
			}else if(Errorlevel=1){
				if(count>5){
					LV_Insert(1,,img2 "가 없습니다. 재시도 합니다.")
					count:=1
					stage:=stage+1
				}else{
					LV_Insert(1,,"현재 화면에" img2 "이(가) 없습니다. 대기중.." count)
					sleep(700)
					count := count+1
				}
			}else{
				LV_Insert(1,,img2 "을(를) 찾았습니다. click 성공")
				return 1
			}
		}
		if(stage>10){
			LV_Insert(1,,"오류 이미지를 둘 다 찾을 수 없습니다")
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
				LV_Insert(1,,img "파일을 찾을 수 없습니다.")
			}else if(Errorlevel=1){
				if(count>5){
					LV_Insert(1,,img "가 없습니다. ")
					count:=1
					stage:=stage+1
				}else{
					LV_Insert(1,,"현재 화면에" img "이(가) 없습니다. 대기중.." count)
					sleep(700)
					count := count+1
				}
			}else{
				LV_Insert(1,,img "을(를) 찾았습니다.")
				count := 1
				nClick(xClick, yClick, range)
				stage:=stage+1
			}
		}else if(Mod(stage,2)=0){
			ImageSearch, , ,x21,y21,x22,y22, *TransBlack *%dp% %A_ScriptDir%\image\%img2%
			if(ErrorLevel=2){
				LV_Insert(1,,img2 "파일을 찾을 수 없습니다.")
			}else if(Errorlevel=1){
				if(count>5){
					LV_Insert(1,,img2 "가 없습니다. 재시도 합니다.")
					count:=1
					stage:=stage+1
				}else{
					LV_Insert(1,,"현재 화면에" img2 "이(가) 없습니다. 대기중.." count)
					sleep(700)
					count := count+1
				}
			}else{
				LV_Insert(1,,img2 "을(를) 찾았습니다. click 성공")
				return 1
			}
		}
		if(stage>10){
			LV_Insert(1,,"오류 이미지를 둘 다 찾을 수 없습니다")
			return 0
		}
		sleep2(400)
	}
}