.386
STACK	SEGMENT	USE16	STACK
	DB	200	DUP(0)
STACK	ENDS

DATA	SEGMENT	USE16
N	EQU	1000
SNUM	DW	1000
COUNT	DW	1000
BUF	DB	'zhangsan', 0, 0, 100, 85, 80, ?
	DB	'lisi', 6 DUP(0), 80, 100,70, ?
	DB	N-4 DUP( 'TempValue',0,80,90,95,?)
	DB	'wangwu', 4 dup(0), 70, 60, 80, 0
	DB	'xuxiaohua', 0, 40, 55, 61, 0

TIP2	DB	0AH, 'NOT FOUND!$'

in_name	DB	10
	DB	6
	DB	'wangwu'	
SEVEN	DB	7
POIN	DW	?
DATA	ENDS

CODE	SEGMENT	USE16
	ASSUME	CS:CODE, DS:DATA, SS:STACK
START:	MOV	AX, DATA
	MOV	DS, AX
	
	XOR	AX, AX	;��ʾ��ʼ��ʱ
	CALL	TIMER
LOOP1:	XOR	BX, BX
AVE:	MOVSX	AX, BUF[BX][10]
	SAL	AX, 2
	MOV	CX, AX
	MOVSX	AX, BUF[BX][11]
	SAL	AX, 1
	ADD	CX, AX
	MOVSX	AX, BUF[BX][12]
	ADD	CX, AX

	;MOVSX	ESI, CX
	;MOV	EAX, 92492493H
	;IMUL	ESI
	;ADD	EDX,ESI
	;SAR	EDX, 2
	;MOV	EAX,EDX
	;SHR	EAX, 1FH
	;ADD	EDX, EAX
	;MOV	BUF[BX][13], DL


	MOV	AX, CX
	DIV	SEVEN
	MOV	BUF[BX][13], AL
	

	ADD	BX, 14
	DEC	SNUM
	JNZ	AVE

	MOV	SNUM, 1000
	XOR	BX, BX

SEAR:	CMP	SNUM, 0
	JZ	NOTF
	MOV	CL, in_name[1] 
	XOR	SI, SI
SEAR1:	MOV	AL, in_name[SI+2]
	CMP	AL, BUF[BX][SI]
	JNZ	NEXTS			;��ǰ�ַ���������¸�ѧ��
	INC	SI			;��������һ���ַ�
	DEC	CL
	JNZ	SEAR1			;�������ַ�δ���������һ��
					;�������ַ�ȫ���������������Ƿ����
ALSAME:	CMP	BUF[BX][SI], 0
	JZ	SCORE			;�����һ�ַ��ǽ�����0��������SCORE
	JMP	NEXTS			;�����һ�ַ���Ϊ0����Ƚ���һѧ��

NEXTS:	ADD	BX,14
	DEC	SNUM
	JMP	SEAR

SCORE:	LEA	AX, BUF[BX]
	MOV	POIN, AX
	MOV	SNUM, 1000
	DEC	COUNT
	JNZ	LOOP1
	MOV	AX, 1	
	CALL	TIMER	;��ֹ��ʱ����ʾ��ʱ���(ms)
	JMP	LAST

NOTF:	LEA	DX, TIP2		;�����ʾδ�ҵ�
	MOV	AH, 9
	INT	21H
	DEC	COUNT
	JNZ	LOOP1

LAST:	MOV	AH, 4CH
	INT	21H


;ʱ�������(ms),����Ļ����ʾ�����ִ��ʱ��(ms)
;ʹ�÷���:
;	   MOV  AX, 0	;��ʾ��ʼ��ʱ
;	   CALL TIMER
;	   ... ...	;��Ҫ��ʱ�ĳ���
;	   MOV  AX, 1	
;	   CALL TIMER	;��ֹ��ʱ����ʾ��ʱ���(ms)
;���: �ı���AX��״̬�Ĵ���
TIMER	PROC
	PUSH  DX
	PUSH  CX
	PUSH  BX
	MOV   BX, AX
	MOV   AH, 2CH
	INT   21H	     ;CH=hour(0-23),CL=minute(0-59),DH=second(0-59),DL=centisecond(0-100)
	MOV   AL, DH
	MOV   AH, 0
	IMUL  AX,AX,1000
	MOV   DH, 0
	IMUL  DX,DX,10
	ADD   AX, DX
	CMP   BX, 0
	JNZ   _T1
	MOV   CS:_TS, AX
_T0:	POP   BX
	POP   CX
	POP   DX
	RET
_T1:	SUB   AX, CS:_TS
	JNC   _T2
	ADD   AX, 60000
_T2:	MOV   CX, 0
	MOV   BX, 10
_T3:	MOV   DX, 0
	DIV   BX
	PUSH  DX
	INC   CX
	CMP   AX, 0
	JNZ   _T3
	MOV   BX, 0
_T4:	POP   AX
	ADD   AL, '0'
	MOV   CS:_TMSG[BX], AL
	INC   BX
	LOOP  _T4
	PUSH  DS
	MOV   CS:_TMSG[BX+0], 0AH
	MOV   CS:_TMSG[BX+1], 0DH
	MOV   CS:_TMSG[BX+2], '$'
	LEA   DX, _TS+2
	PUSH  CS
	POP   DS
	MOV   AH, 9
	INT   21H
	POP   DS
	JMP   _T0
_TS	DW    ?
 	DB    'Time elapsed in ms is '
_TMSG	DB    12 DUP(0)
TIMER   ENDP

CODE	ENDS
	END	START
