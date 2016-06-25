.386
STACK	SEGMENT	STACK	USE16
	DB	200	DUP(0)
STACK	ENDS
DATA	SEGMENT	USE16
	BUF	DB	10 DUP(0)
DATA	ENDS

CODE	SEGMENT	USE16
	ASSUME	CS:CODE, SS:STACK, DS:DATA
        
;�ӳ�������RADIX
;���ܣ���EAX�е�32λ�޷��Ŷ�������ת����P��������16λ�Σ�
;��ڲ�����
;EAX������Ŵ�ת����32λ�޷��Ŷ�������
;EBX�������Ҫת�����ƵĻ���
;SI�������ת�����P����ASCLL�����ִ����ֽڻ�������ַ
;���ڲ�����
;����P����ASCLL�����ִ�����λ��ǰ����λ�ں��˳��������SIΪָ����ֽڻ�������
;SI����ָ���ֽڻ����������һ��ASCLL�����һ���ֽ�
;��ʹ�õļĴ�����
;CX����P����������ջ����ջʱ�ļ�����
;EDX����������ʱ��ű�������λ������

RADIX	PROC	
	PUSH	CX
	PUSH	EDX		;�����ֳ�
	XOR	CX, CX		;���������� 
LOP1:	XOR	EDX, EDX
	DIV	EBX
	PUSH	DX
	INC	CX
	OR	EAX,EAX		;��(EAX)!=0,��ת��LOP1
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
	MOV	BYTE PTR [SI], '$'       ;д�������
	INC	SI
	POP	EDX
	POP	CX
	RET
RADIX	ENDP


START:	MOV	AH, 1
	INT	21H
	SUB	AL, '0'     ; �������ַ�ת��Ϊ����
	MOV	AH, 0
	MOV	DX, 70H	    ;���˿ں�����dx
	OUT	DX, AX      
	XOR	EAX, EAX
	IN	AX, 71H     ; ��ȡ�˿���Ϣ��al
	MOV	EBX, 10H
	LEA	SI, BUF
	CALL	RADIX       ; ���˿���Ϣ��Ϊ16�������ִ�
	MOV	DL, ' '     ; ���16�������ִ�
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