.386
STACK	SEGMENT	USE16	STACK
	DB	200	DUP(0)
STACK	ENDS

DATA	SEGMENT	USE16
BUF	DB	('h'-10H),('u'-10H),('c'-10H),('h'-10H),('a'-10H),('o'-10H),('1'-10H), 3 DUP(0), 80 xor 's', 90 xor '+', 70 xor 'm', ?
	DB	('l'-10H),('d'-10H),('a'-10H),('s'-10H),('h'-10H),('e'-10H),('n'-10H), 3 DUP(0), 99 xor 's', 99 xor '+', 99 xor 'm', ?
	DB	('z'-10H),('h'-10H),('a'-10H),('n'-10H),('g'-10H),('d'-10H),('z'-10H), 3 DUP(0), 78 xor 's', 70 xor '+', 88 xor 'm', ?
TIP0	DB	0AH,'INPUT PASSWORD:$'
TIP1	DB	0AH, 0AH, "input student's name:$"
TIP2	DB	0AH, 'NOT FOUND!$'
GRA1	DB	0AH, 'A$'
GRA2	DB	0AH, 'B$'
GRA3	DB	0AH, 'C$'
GRA4	DB	0AH, 'D$'
GRA5	DB	0AH, 'F$'
PASSW	DB	2 XOR 'p'
	DB	'S' XOR 'a'
	DB	'+' XOR	's', 'm' XOR 's', 'A' XOR 'w', 'S' XOR 'd'
in_pass	DB	20
	DB	?
	DB	20	DUP(0)
in_name	DB	10
	DB	?
	DB	10	DUP(0)	
SEVEN	DB	7
POIN	DW	?
TOEND	DW	LAST
OK	DW	OK2
OLDINT1 DW  0,0               ;1号中断的原中断矢量（用于中断矢量表反跟踪）
OLDINT3 DW  0,0               ;3号中断的原中断矢量
DATA	ENDS

CODE	SEGMENT	USE16
	ASSUME	CS:CODE, DS:DATA, SS:STACK
START:	MOV	AX, DATA
	MOV	DS, AX

;-----------接管中断--------------------------------------------------------------

NEWINT: iret

       xor  ax,ax                  ;接管调试用中断，中断矢量表反跟踪
       mov  es,ax
       mov  ax,es:[1*4]            ;保存原1号和3号中断矢量
       mov  OLDINT1,ax
       mov  ax,es:[1*4+2]
       mov  OLDINT1+2,ax
       mov  ax,es:[3*4]
       mov  OLDINT3,ax
       mov  ax,es:[3*4+2]
       mov  OLDINT3+2,ax
       cli                           ;设置新的中断矢量
       mov  ax,OFFSET NEWINT
       mov  es:[1*4],ax
       mov  es:[1*4+2],cs
       mov  es:[3*4],ax
       mov  es:[3*4+2],cs
       sti

;-----------比较密码--------------------------------------------------------------
	LEA	DX, TIP0		;提示输入密码
	MOV	AH, 9
	INT	21H	
	LEA	DX, in_pass		;输入密码
	MOV	AH, 10
	INT	21H
	
	CLI	                 	;计时反跟踪开始 
	MOV	AH, 2CH	 
	INT	21H
	PUSH	DX                   	;保存获取的秒和百分秒
	
	MOV	CL, in_pass+1           ;比较输入的串长与密码长度是否一样
	MOV	DL, 'P'
	ADD	DL, 20H
	XOR	CL, DL
	SUB	CL, PASSW
	JNZ	LAST
	MOVSX	BX, CL
	MOV	BX, OFFSET OK  	

	MOV	AH,2CH                 	;获取第二次秒与百分秒
	INT	21H
	STI
	CMP	DX, [ESP]               ;计时是否相同
	POP	DX
	JZ	PASS1                   ;如果计时相同，通过本次计时反跟踪   
	MOV	BX, OFFSET TOEND        ;如果计时不同，则退出

PASS1:	MOVZX	AX, in_pass[SI]    ;比较密码是否相同。把输入的串变成密文，与保存的密文比较
        XOR	AX, 'p'
        CMP	AL,PASSW[SI]
	JNZ	SOME0
SOME0:	INC	SI
	MOVZX	AX, in_pass[SI]    
        XOR	AX, 'a'
        CMP	AL,PASSW[SI]
	JNZ	SOME1
SOME1:	INC	SI
	MOVZX	AX, in_pass[SI]    
        XOR	AX, 's'
        CMP	AL,PASSW[SI]
	JNZ	LAST
	INC	SI
	MOVZX	AX, in_pass[SI]    
        XOR	AX, 's'
        CMP	AL,PASSW[SI]
	JNZ	LAST
	INC	SI
	MOVZX	AX, in_pass[SI]    
        XOR	AX, 'w'
        CMP	AL,PASSW[SI]
	JNZ	SOME2
SOME2:	INC	SI
	MOVZX	AX, in_pass[SI]    
        XOR	AX, 'd'
        CMP	AL,PASSW[SI]

        JMP	OK1


;-----------计算平均成绩--------------------------------------------------------
OK1:	MOV	BX, [BX]
	JMP	BX

OK2:	MOV	BX, 0
AVE:	MOV	AL, 4
	PUSH	BX
	MOV	BL, BUF[BX][10]
	XOR	BL, 's'
	MUL	BL
	POP	BX
	MOV	CX, AX
	MOV	AL, 2
	PUSH	BX
	MOV	BL, BUF[BX][11]
	XOR	BL, in_pass+2
	MUL	BL
	POP	BX
	ADD	CX, AX
	MOV	AL, 1
	PUSH	BX
	MOV	BL, BUF[BX][12]
	XOR	BL, in_pass+3
	MUL	BL
	POP	BX
	ADD	CX, AX
	MOV	AX, CX
	DIV	SEVEN
	MOV	BUF[BX][13], AL
	ADD	BX,14
	CMP	BX, 56
	JNZ	AVE

;------------输入姓名并比较---------------------------------------------------
INPUT:	

	LEA	DX, TIP1		;输出提示
	MOV	AH, 9
	INT	21H	
	LEA	DX, in_name		;输入名字
	MOV	AH, 10
	INT	21H
	MOV	SI, 0
	MOV	BX, 0
	MOV	CL, in_name[1] 		;CL存放名字长度
	CMP	CL, 1			;看是否只输了一个字
	JZ	IFQUI			;只有一个字符则看是否要退出
	JNZ	SEAR			;不只一个则进行学生查找

IFQUI:	CMP	in_name[2], 'q'
	JZ	LAST			;输了q则退出
	
SEAR:	CMP	BX, 56
	JZ	NOTF
	MOV	CL, in_name[1] 
	MOV	SI, 0
SEAR1:	MOV	AL, in_name[SI+2]
	SUB	AL, 10H
	CMP	AL, BUF[BX][SI]
	JNZ	NEXTS			;当前字符不等则查下个学生
	INC	SI			;相等则查下一个字符
	DEC	CL
	JNZ	SEAR1			;名字中字符未查完则查下一个
	JZ	ALSAME			;名字中字符全相等则查已有名字是否结束

ALSAME:	CMP	BUF[BX][SI], 0
	JZ	SCORE			;如果下一字符是结束符0，则跳至SCORE
	JMP	NEXTS			;如果下一字符不为0，则比较下一学生

;---------判断等第------------------------------------------------------------
SCORE:	LEA	AX, BUF[BX]
	MOV	POIN, AX
	CMP	BUF[BX][13], 90
	JGE	SCORE1
	CMP	BUF[BX][13], 80
	JGE	SCORE2
	CMP	BUF[BX][13], 70
	JGE	SCORE3
	CMP	BUF[BX][13], 60
	JGE	SCORE4
	JMP	SCORE5
		
SCORE1:	LEA	DX, GRA1		
	MOV	AH, 9
	INT	21H
	JMP	INPUT
SCORE2:	LEA	DX, GRA2		
	MOV	AH, 9
	INT	21H
	JMP	INPUT
SCORE3:	LEA	DX, GRA3		
	MOV	AH, 9
	INT	21H
	JMP	INPUT
SCORE4:	LEA	DX, GRA4		
	MOV	AH, 9
	INT	21H
	JMP	INPUT
SCORE5:	LEA	DX, GRA5		
	MOV	AH, 9
	INT	21H
	JMP	INPUT

NEXTS:	ADD	BX,14
	JMP	SEAR

NOTF:	LEA	DX, TIP2		;输出提示未找到
	MOV	AH, 9
	INT	21H
	JMP	INPUT

LAST:	
	JMP OVER


;------------还原中断并退出----------------------------------------
OVER:
       cli                           ;还原中断矢量
       mov  ax,OLDINT1
       mov  es:[1*4],ax
       mov  ax,OLDINT1+2
       mov  es:[1*4+2],ax
       mov  ax,OLDINT3
       mov  es:[3*4],ax
       mov  ax,OLDINT3+2
       mov  es:[3*4+2],ax 
       sti
	MOV	AH, 4CH
	INT	21H

CODE	ENDS
	END	START