.386
.model   flat,stdcall
option   casemap:none

WinMain  proto :DWORD,:DWORD,:DWORD,:DWORD
WndProc  proto :DWORD,:DWORD,:DWORD,:DWORD
Display  proto :DWORD
Average  proto 


include      ex8.INC

include      WINDOWS.INC
include      user32.inc
include      kernel32.inc
include      gdi32.inc
include      shell32.inc

includelib   user32.lib
includelib   kernel32.lib
includelib   gdi32.lib
includelib   shell32.lib

student	     struct
	     myname   db  10 dup(0)
	     chinese  db  0
	     math     db  0
	     english  db  0
	     average  db  0
	     grade    db  0
student      ends

.data
ClassName    db       'TryWinClass',0
AppName      db       "Students' Scores Management System",0
MenuName     db       'MyMenu',0
DlgName	     db       'MyDialog',0
AboutMsg     db       'Œ“ «CS1409’≈µ§÷Ï',0
hInstance    dd       0
CommandLine  dd       0
buf	     student  <>
	     student  <'gongtong',80,100,78,?,' '>
	     student  <'xuezha',60,59,12,?,' '>
	     student  <'liuyilong',99,99,99,?,' '>
	     student  <'huchao',78,92,80,?,' '>
	     student  <'zdz',82,65,88,?,' '>
msg_name     db       'name',0
msg_chinese  db       'chinese',0
msg_math     db       'math',0
msg_english  db       'english',0
msg_average  db       'average',0
msg_grade    db       'grade',0
stuname	     db       0,8,6,9,6,3
chinese	     db       0,2,2,2,2,2,'80','60','99','78','82'
math	     db       0,3,2,2,2,2,'100','59','99','92','65'
english	     db       0,2,2,2,2,2,'78','12','99','80','88'
average	     db       0,2,2,2,2,2,'  ','  ','  ','  ','  '
SEVEN	DB	7
TEN	DB	10


.code
Start:       invoke GetModuleHandle,NULL
	     mov    hInstance,eax
	     invoke GetCommandLine
	     mov    CommandLine,eax
	     invoke WinMain,hInstance,NULL,CommandLine,SW_SHOWDEFAULT
	     invoke ExitProcess,eax
	     ;;
WinMain      proc   hInst:DWORD,hPrevInst:DWORD,CmdLine:DWORD,CmdShow:DWORD
	     LOCAL  wc:WNDCLASSEX
	     LOCAL  msg:MSG
	     LOCAL  hWnd:HWND
             invoke RtlZeroMemory,addr wc,sizeof wc
	     mov    wc.cbSize,SIZEOF WNDCLASSEX
	     mov    wc.style, CS_HREDRAW or CS_VREDRAW
	     mov    wc.lpfnWndProc, offset WndProc
	     mov    wc.cbClsExtra,NULL
	     mov    wc.cbWndExtra,NULL
	     push   hInst
	     pop    wc.hInstance
	     mov    wc.hbrBackground,COLOR_WINDOW+1
	     mov    wc.lpszMenuName, offset MenuName
	     mov    wc.lpszClassName,offset ClassName
	     invoke LoadIcon,NULL,IDI_APPLICATION
	     mov    wc.hIcon,eax
	     mov    wc.hIconSm,0
	     invoke LoadCursor,NULL,IDC_ARROW
	     mov    wc.hCursor,eax
	     invoke RegisterClassEx, addr wc
	     INVOKE CreateWindowEx,NULL,addr ClassName,addr AppName,\
                    WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,\
                    CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,NULL,NULL,\
                    hInst,NULL
	     mov    hWnd,eax
	     INVOKE ShowWindow,hWnd,SW_SHOWNORMAL
	     INVOKE UpdateWindow,hWnd
	     ;;
MsgLoop:     INVOKE GetMessage,addr msg,NULL,0,0
             cmp    EAX,0
             je     ExitLoop
             INVOKE TranslateMessage,addr msg
             INVOKE DispatchMessage,addr msg
	     jmp    MsgLoop 
ExitLoop:    mov    eax,msg.wParam
	     ret
WinMain      endp

WndProc      proc   hWnd:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
	     LOCAL  hdc:HDC
     .IF     uMsg == WM_DESTROY
	     invoke PostQuitMessage,NULL
     .ELSEIF uMsg == WM_KEYDOWN
	    .IF     wParam == VK_F1
             ;;your code
	    .ENDIF
     .ELSEIF uMsg == WM_COMMAND
	    .IF     wParam == IDM_FILE_EXIT
		    invoke SendMessage,hWnd,WM_CLOSE,0,0
	    .ELSEIF wParam == IDM_ACTION_LIST
		    invoke Display,hWnd
	    .ELSEIF wParam == IDM_HELP_ABOUT
		    invoke MessageBox,hWnd,addr AboutMsg,addr AppName,0
	    .ELSEIF wParam == IDM_ACTION_AVERAGE
		    invoke Average
	    .ENDIF
     .ELSEIF uMsg == WM_PAINT
	     ;;redraw window again
     .ELSE
             invoke DefWindowProc,hWnd,uMsg,wParam,lParam
             ret
     .ENDIF
  	     xor    eax,eax
	     ret
WndProc      endp

Display	proc   hWnd:DWORD
	XX     equ  10
	YY     equ  10
	XX_GAP equ  100
	YY_GAP equ  30
	LOCAL  hdc:HDC
	invoke GetDC,hWnd
	mov    hdc,eax
	invoke TextOut,hdc,XX+0*XX_GAP,YY+0*YY_GAP,offset msg_name,4	
	invoke TextOut,hdc,XX+1*XX_GAP,YY+0*YY_GAP,offset msg_chinese,7
	invoke TextOut,hdc,XX+2*XX_GAP,YY+0*YY_GAP,offset msg_math,4
	invoke TextOut,hdc,XX+3*XX_GAP,YY+0*YY_GAP,offset msg_english,7
	invoke TextOut,hdc,XX+4*XX_GAP,YY+0*YY_GAP,offset msg_average,7
	invoke TextOut,hdc,XX+5*XX_GAP,YY+0*YY_GAP,offset msg_grade,5
	;;
	invoke TextOut,hdc,XX+0*XX_GAP,YY+1*YY_GAP,offset buf[1*15].myname,stuname+1
	invoke TextOut,hdc,XX+1*XX_GAP,YY+1*YY_GAP,offset chinese+6,chinese+1
	invoke TextOut,hdc,XX+2*XX_GAP,YY+1*YY_GAP,offset math+6,math+1
	invoke TextOut,hdc,XX+3*XX_GAP,YY+1*YY_GAP,offset english+6,english+1
	invoke TextOut,hdc,XX+4*XX_GAP,YY+1*YY_GAP,offset average+6,average+1
	invoke TextOut,hdc,XX+5*XX_GAP,YY+1*YY_GAP,offset buf[1*15].grade,1
	;;
	invoke TextOut,hdc,XX+0*XX_GAP,YY+2*YY_GAP,offset buf[2*15].myname,stuname+2
	invoke TextOut,hdc,XX+1*XX_GAP,YY+2*YY_GAP,offset chinese+8,chinese+2
	invoke TextOut,hdc,XX+2*XX_GAP,YY+2*YY_GAP,offset math+8,math+2
	invoke TextOut,hdc,XX+3*XX_GAP,YY+2*YY_GAP,offset english+8,english+2
	invoke TextOut,hdc,XX+4*XX_GAP,YY+2*YY_GAP,offset average+8,average+2
	invoke TextOut,hdc,XX+5*XX_GAP,YY+2*YY_GAP,offset buf[2*15].grade,1
	;;
	invoke TextOut,hdc,XX+0*XX_GAP,YY+3*YY_GAP,offset buf[3*15].myname,stuname+3
	invoke TextOut,hdc,XX+1*XX_GAP,YY+3*YY_GAP,offset chinese+10,chinese+3
	invoke TextOut,hdc,XX+2*XX_GAP,YY+3*YY_GAP,offset math+10,math+3
	invoke TextOut,hdc,XX+3*XX_GAP,YY+3*YY_GAP,offset english+10,english+3
	invoke TextOut,hdc,XX+4*XX_GAP,YY+3*YY_GAP,offset average+10,average+3
	invoke TextOut,hdc,XX+5*XX_GAP,YY+3*YY_GAP,offset buf[3*15].grade,1
	;;
	invoke TextOut,hdc,XX+0*XX_GAP,YY+4*YY_GAP,offset buf[4*15].myname,stuname+4
	invoke TextOut,hdc,XX+1*XX_GAP,YY+4*YY_GAP,offset chinese+12,chinese+4
	invoke TextOut,hdc,XX+2*XX_GAP,YY+4*YY_GAP,offset math+12,math+4
	invoke TextOut,hdc,XX+3*XX_GAP,YY+4*YY_GAP,offset english+12,english+4
	invoke TextOut,hdc,XX+4*XX_GAP,YY+4*YY_GAP,offset average+12,average+4
	invoke TextOut,hdc,XX+5*XX_GAP,YY+4*YY_GAP,offset buf[4*15].grade,1
	;;
	invoke TextOut,hdc,XX+0*XX_GAP,YY+5*YY_GAP,offset buf[5*15].myname,stuname+5
	invoke TextOut,hdc,XX+1*XX_GAP,YY+5*YY_GAP,offset chinese+14,chinese+5
	invoke TextOut,hdc,XX+2*XX_GAP,YY+5*YY_GAP,offset math+14,math+5
	invoke TextOut,hdc,XX+3*XX_GAP,YY+5*YY_GAP,offset english+14,english+5
	invoke TextOut,hdc,XX+4*XX_GAP,YY+5*YY_GAP,offset average+14,average+5
	invoke TextOut,hdc,XX+5*XX_GAP,YY+5*YY_GAP,offset buf[5*15].grade,1
	ret
Display	endp

Average	proc    
	push	esi	
	push	edi
	push	eax
	push	ebx
	push	ecx
	push	edx
	
	lea	edi, buf
	MOV	EBX, 0
	MOV	ESI, 4

AVE:	
	ADD	edi, 15
	INC	EBX
	ADD	ESI, 2
	MOV	AL, 4
	MUL	BYTE PTR 10[edi]
	MOV	CX, AX
	MOV	AL, 2
	MUL	BYTE PTR 11[edi]
	ADD	CX, AX
	MOV	AL, 1
	MUL	BYTE PTR 12[edi]
	ADD	CX, AX
	MOV	AX, CX
	DIV	SEVEN
	MOV	BYTE PTR 13[edi], AL
	cmp	BYTE PTR 13[edi], 90
	jge	TA

	cmp	BYTE PTR 13[edi], 80
	JGE	TB
	cmp	BYTE PTR 13[edi], 70
	jge	TC
	cmp	BYTE PTR 13[edi], 60
	jge	TD
	MOV	BYTE PTR 14[edi], 'F'
	JMP	AVESCO

TA:	MOV	BYTE PTR 14[edi], 'A'
	JMP	AVESCO
TB:	MOV	BYTE PTR 14[edi], 'B'
	JMP	AVESCO
TC:	MOV	BYTE PTR 14[edi], 'C'
	JMP	AVESCO
TD:	MOV	BYTE PTR 14[edi], 'D'

	
AVESCO:	MOV	AH, 0
	DIV	TEN
	MOV	average[ESI], AL
	MOV	average[ESI+1], AH
	ADD	average[ESI], 30H
	ADD	average[ESI+1], 30H
	
	CMP	EBX, 5
	JNZ	AVE

	pop	edx
	pop	ecx
	pop	ebx
	pop	eax
	pop	edi
	pop	esi
	ret
Average	endp



	end	Start
