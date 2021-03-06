.386
.model	flat, c
.code
public	sear
sear 	PROC
	PUSH	EBP
	PUSH	ESI
	PUSH	EDI
	PUSH	EAX
	PUSH	EBX
	PUSH	ECX
	PUSH	EDX
	MOV	EBP, ESP
	MOV	EBX, [EBP+32]

	XOR	ESI, ESI
	XOR	EDX, EDX		
SEAR0:	CMP	EDX, 4
	JZ	NOTF
	MOV	EDI, [EBP+40]
	MOV	CL, BYTE PTR [EDI] 		;CL存放名字长度
	MOV	ESI, 0
SEAR1:	MOV	EDI, [EBP+36]			;in_name的地址
	ADD	EDI, ESI
	MOV	AL, BYTE PTR [EDI]
	PUSH 	EBX
	ADD	EBX, ESI
	CMP	AL, BYTE PTR [EBX]
	POP 	EBX
	JNZ	NEXTS			;当前字符不等则查下个学生
	INC	ESI			;相等则查下一个字符
	DEC	CL
	JNZ	SEAR1			;名字中字符未查完则查下一个
	JZ	ALSAME			;名字中字符全相等则查已有名字是否结束
		
ALSAME:	PUSH	EBX
	ADD	EBX, ESI
	CMP	BYTE PTR [EBX], 0
	POP	EBX
	JZ	SCORE			;如果下一字符是结束符0，则跳至SCORE
	JMP	NEXTS			;如果下一字符不为0，则比较下一学生
	
SCORE:	MOV	[EBP+44], EBX
	CMP	BYTE PTR [EBX][13], 90
	JGE	SCORE1
	CMP	BYTE PTR [EBX][13], 80
	JGE	SCORE2
	CMP	BYTE PTR [EBX][13], 70
	JGE	SCORE3
	CMP	BYTE PTR [EBX][13], 60
	JGE	SCORE4
	JMP	SCORE5
	
SCORE1:	MOV	EDI, [EBP+48]
	MOV	[EDI], BYTE PTR 'A'
	JMP	LAST
SCORE2:	MOV	EDI, [EBP+48]
	MOV	[EDI], BYTE PTR 'B'
	JMP	LAST
SCORE3:	MOV	EDI, [EBP+48]
	MOV	[EDI], BYTE PTR 'C'
	JMP	LAST
SCORE4:	MOV	EDI, [EBP+48]
	MOV	[EDI], BYTE PTR 'D'
	JMP	LAST
SCORE5:	MOV	EDI, [EBP+48]
	MOV	[EDI], BYTE PTR 'F'
	JMP	LAST
		
NEXTS:	ADD	EBX,14
	INC	EDX
	JMP	SEAR0
		
NOTF:	MOV	EDI, [EBP+52]
	MOV	[EDI], BYTE PTR 0
LAST:	POP	EDX
	POP	ECX
	POP	EBX
	POP	EAX
	POP	EDI
	POP	ESI
	POP	EBP
	RET
sear	ENDP
	END