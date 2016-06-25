.386
STACK	SEGMENT	STACK	USE16
	DB	200	DUP(0)
STACK	ENDS
DATA	SEGMENT	USE16
	BUF	DB	10 DUP(0)
DATA	ENDS

CODE	SEGMENT	USE16
	ASSUME	CS:CODE, SS:STACK, DS:DATA
        
;子程序名：RADIX
;功能：将EAX中的32位无符号二进制数转换成P进制数（16位段）
;入口参数：
;EAX——存放待转换的32位无符号二进制数
;EBX——存放要转换数制的基数
;SI——存放转换后的P进制ASCLL码数字串的字节缓冲区首址
;出口参数：
;所求P进制ASCLL码数字串按高位在前、低位在后的顺序存放在以SI为指针的字节缓冲区中
;SI——指向字节缓冲区中最后一个ASCLL码的下一个字节
;所使用的寄存器：
;CX——P进制数字入栈、出栈时的计数器
;EDX——做除法时存放被除数高位或余数

RADIX	PROC	
	PUSH	CX
	PUSH	EDX		;保护现场
	XOR	CX, CX		;计数器清零 
LOP1:	XOR	EDX, EDX
	DIV	EBX
	PUSH	DX
	INC	CX
	OR	EAX,EAX		;若(EAX)!=0,跳转到LOP1
	JNZ	LOP1
LOP2:	POP	AX
	CMP	AL, 10
	JB	L1
	ADD	AL, 7
L1:	ADD	AL,30H
	MOV	[SI], AL
	INC	SI
	LOOP	LOP2
	MOV	BYTE PTR [SI], 0AH
	INC	SI
	MOV	BYTE PTR [SI], 0DH
	INC	SI
	MOV	BYTE PTR [SI], '$'       ;写入结束符
	INC	SI
	POP	EDX
	POP	CX
	RET
RADIX	ENDP


START:	MOV	AH, 1
	INT	21H
	SUB	AL, '0'     ; 将输入字符转化为数字
	MOV	AH, 0
	MOV	DX, 70H	    ;将端口号送入dx
	OUT	DX, AX      
	XOR	EAX, EAX
	IN	AX, 71H     ; 读取端口信息至al
	MOV	EBX, 10H
	LEA	SI, BUF
	CALL	RADIX       ; 将端口信息化为16进制数字串
	MOV	DL, ' '     ; 输出16进制数字串
	MOV	AH, 2H
	INT	21H
	MOV	DL, '0'
	MOV	AH, 2H
	INT	21H
	MOV	DL, 'x'
	MOV	AH, 2H
	INT	21H	
	LEA	DX, BUF
	MOV	AH, 9H
	INT	21H         
 
FINISH:	MOV	AH, 4CH
	INT	21H
CODE	ENDS
	END	START