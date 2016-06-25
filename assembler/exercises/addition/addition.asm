EXTRN	F2T10:NEAR, F10T2:NEAR

.386
STACK	SEGMENT	USE16	STACK
	DB	200	DUP(0)
STACK	ENDS

DATA	SEGMENT	USE16	PUBLIC
ADDN	DB	5, ?, 5 DUP(0)
SUM	DD	?
TIPA	DB	0AH, 'a:$'
TIPB	DB	0AH, 'b:$'
TIPS	DB	0AH, 'a+b:$'
DATA	ENDS

CODE	SEGMENT	USE16	PUBLIC
	ASSUME	CS:CODE, DS:DATA, SS:STACK
START:	MOV	AX, DATA
	MOV	DS, AX

	LEA	BX, TIPA
	CALL	PLUS
	MOVSX	EAX, AX
	MOV	SUM, EAX
	LEA	BX, TIPB
	CALL	PLUS
	MOVSX	EAX, AX
	ADD	SUM, EAX
	LEA	DX, TIPS
	MOV	AH, 9
	INT	21H
	MOV	EAX, SUM
	MOV	DX, 32
	CALL	F2T10
	MOV	AH, 4CH
	INT	21H
;子程序名：PLUS
;入口参数：提示符串首址->BX
;出口参数：输入的二进制数->AX
PLUS	PROC
	MOV	DX, BX
	MOV	AH, 9
	INT	21H
	LEA	DX, ADDN
	MOV	AH, 10
	INT	21H
	LEA	SI, ADDN[2]
	MOVSX	CX, ADDN[1]
	MOV	DX, 16
	CALL	F10T2
	RET
PLUS	ENDP


CODE	ENDS
	END	START
