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
OLDINT1 DW  0,0               ;1���жϵ�ԭ�ж�ʸ���������ж�ʸ�������٣�
OLDINT3 DW  0,0               ;3���жϵ�ԭ�ж�ʸ��
DATA	ENDS

CODE	SEGMENT	USE16
	ASSUME	CS:CODE, DS:DATA, SS:STACK
START:	MOV	AX, DATA
	MOV	DS, AX

;-----------�ӹ��ж�--------------------------------------------------------------

NEWINT: iret

       xor  ax,ax                  ;�ӹܵ������жϣ��ж�ʸ��������
       mov  es,ax
       mov  ax,es:[1*4]            ;����ԭ1�ź�3���ж�ʸ��
       mov  OLDINT1,ax
       mov  ax,es:[1*4+2]
       mov  OLDINT1+2,ax
       mov  ax,es:[3*4]
       mov  OLDINT3,ax
       mov  ax,es:[3*4+2]
       mov  OLDINT3+2,ax
       cli                           ;�����µ��ж�ʸ��
       mov  ax,OFFSET NEWINT
       mov  es:[1*4],ax
       mov  es:[1*4+2],cs
       mov  es:[3*4],ax
       mov  es:[3*4+2],cs
       sti

;-----------�Ƚ�����--------------------------------------------------------------
	LEA	DX, TIP0		;��ʾ��������
	MOV	AH, 9
	INT	21H	
	LEA	DX, in_pass		;��������
	MOV	AH, 10
	INT	21H
	
	CLI	                 	;��ʱ�����ٿ�ʼ 
	MOV	AH, 2CH	 
	INT	21H
	PUSH	DX                   	;�����ȡ����Ͱٷ���
	
	MOV	CL, in_pass+1           ;�Ƚ�����Ĵ��������볤���Ƿ�һ��
	MOV	DL, 'P'
	ADD	DL, 20H
	XOR	CL, DL
	SUB	CL, PASSW
	JNZ	LAST
	MOVSX	BX, CL
	MOV	BX, OFFSET OK  	

	MOV	AH,2CH                 	;��ȡ�ڶ�������ٷ���
	INT	21H
	STI
	CMP	DX, [ESP]               ;��ʱ�Ƿ���ͬ
	POP	DX
	JZ	PASS1                   ;�����ʱ��ͬ��ͨ�����μ�ʱ������   
	MOV	BX, OFFSET TOEND        ;�����ʱ��ͬ�����˳�

PASS1:	MOVZX	AX, in_pass[SI]    ;�Ƚ������Ƿ���ͬ��������Ĵ�������ģ��뱣������ıȽ�
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


;-----------����ƽ���ɼ�--------------------------------------------------------
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

;------------�����������Ƚ�---------------------------------------------------
INPUT:	

	LEA	DX, TIP1		;�����ʾ
	MOV	AH, 9
	INT	21H	
	LEA	DX, in_name		;��������
	MOV	AH, 10
	INT	21H
	MOV	SI, 0
	MOV	BX, 0
	MOV	CL, in_name[1] 		;CL������ֳ���
	CMP	CL, 1			;���Ƿ�ֻ����һ����
	JZ	IFQUI			;ֻ��һ���ַ����Ƿ�Ҫ�˳�
	JNZ	SEAR			;��ֻһ�������ѧ������

IFQUI:	CMP	in_name[2], 'q'
	JZ	LAST			;����q���˳�
	
SEAR:	CMP	BX, 56
	JZ	NOTF
	MOV	CL, in_name[1] 
	MOV	SI, 0
SEAR1:	MOV	AL, in_name[SI+2]
	SUB	AL, 10H
	CMP	AL, BUF[BX][SI]
	JNZ	NEXTS			;��ǰ�ַ���������¸�ѧ��
	INC	SI			;��������һ���ַ�
	DEC	CL
	JNZ	SEAR1			;�������ַ�δ���������һ��
	JZ	ALSAME			;�������ַ�ȫ���������������Ƿ����

ALSAME:	CMP	BUF[BX][SI], 0
	JZ	SCORE			;�����һ�ַ��ǽ�����0��������SCORE
	JMP	NEXTS			;�����һ�ַ���Ϊ0����Ƚ���һѧ��

;---------�жϵȵ�------------------------------------------------------------
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

NOTF:	LEA	DX, TIP2		;�����ʾδ�ҵ�
	MOV	AH, 9
	INT	21H
	JMP	INPUT

LAST:	
	JMP OVER


;------------��ԭ�жϲ��˳�----------------------------------------
OVER:
       cli                           ;��ԭ�ж�ʸ��
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