;子程序名：F10T2
;功能：将SI指向的有符号十进制字符串转换成二进制数
;入口参数：
;SI——存放待转换的有符号十进制数字符串首地址
;CX——串长
;DX——32位或16位
;出口参数：
;EAX/AX——存放转换后的二进制数
;所使用的寄存器：
;EBX——存放每次要转换的字符

NAME	F10T2
PUBLIC	F10T2

.386
DATA	SEGMENT	USE16	PUBLIC
SIGN	DB	?
DATA	ENDS
CODE	SEGMENT	USE16	PUBLIC
	ASSUME	CS:CODE, DS:DATA
F10T2	PROC		
	PUSH	EBX
	XOR	EAX, EAX
	MOV	SIGN, 0
	MOV	BL, [SI]	;取一字符到BL中
	CMP	BL, '+'
	JE	F10
	CMP	BL, '-'
	JNE	NEXT2
	MOV	SIGN, 1
F10:	DEC	CX
	JZ	ERR
NEXT1:	INC	SI
	MOV	BL, [SI]
NEXT2:	CMP	BL, '0'
	JB	ERR
	CMP	BL, '9'
	JA	ERR
	SUB	BL, 30H
	MOVZX	EBX, BL
	IMUL	EAX, 10
	JO	ERR
	ADD	EAX, EBX
	JO	ERR
	JS	ERR
	JC	ERR
	DEC	CX
	JNZ	NEXT1
	CMP	DX, 16
	JNE	NEGEAX
	CMP	EAX, 7FFFH
	JA	ERR
NEGEAX:	CMP	SIGN, 1
	JNE	TOBACK
	NEG	EAX
TOBACK:	POP	EBX
	RET
ERR:	MOV	SI, -1
	JMP	TOBACK
F10T2	ENDP
CODE	ENDS
	END