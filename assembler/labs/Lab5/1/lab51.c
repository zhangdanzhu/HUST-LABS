#include <stdio.h>
#include <stdlib.h>
#include <string.h>


 
int main(int argc, char *argv[])
{
	/** 学生成绩缓冲区 **/	
	unsigned char BUF[56] = {'z','d','z',0,0,0,0,0,0,0,78,70,88,0,
						'L','Y','L',0,0,0,0,0,0,0,82,92,90,0,
						'h','u','c','h','a','o',0,0,0,0,99,99,99,0,
						'g','o','n','g','t','o','n','g',0,0,78,100,85 
						};	
	unsigned char *POIN;		/** 用于保存查找到的学生的成绩表起始地址 **/
	char in_name[10];
	char len_name;
	char flag = 1;
	char SEVEN = 7;
	char GRA;
	__asm {
			MOV	EBX, 0
	AVE:	MOV	AL, 4
			MUL	BUF[EBX][10]
			MOV	CX, AX
			MOV	AL, 2
			MUL	BUF[EBX][11]
			ADD	CX, AX
			MOV	AL, 1
			MUL	BUF[EBX][12]
			ADD	CX, AX
			MOV	AX, CX
			DIV	SEVEN
			MOV	BUF[EBX][13], AL
			ADD	EBX,14
			CMP	EBX, 56
			JNZ	AVE
	}
	while (1)
	{
		flag = 1;
		printf("Please input student's name：");
		gets(in_name); 
		if (strcmp(in_name,"q") == 0)
		{
			break;
		}
		len_name = strlen(in_name);	
		__asm {
			MOV	ESI, 0
			MOV	BX, 0
			
	
	SEAR:	CMP	BX, 56
			JZ	NOTF
			MOV	CL, len_name 		;CL存放名字长度
			MOV	ESI, 0
SEAR1:	MOV	AL, in_name[ESI]
		PUSH EBX
		ADD	EBX, ESI
		CMP	AL, BUF[EBX]
		POP EBX
		JNZ	NEXTS			;当前字符不等则查下个学生
		INC	ESI			;相等则查下一个字符
		DEC	CL
		JNZ	SEAR1			;名字中字符未查完则查下一个
		JZ	ALSAME			;名字中字符全相等则查已有名字是否结束
		
ALSAME:	PUSH EBX
		ADD EBX, ESI
		CMP	BUF[EBX], 0
		POP EBX
		JZ	SCORE			;如果下一字符是结束符0，则跳至SCORE
		JMP	NEXTS			;如果下一字符不为0，则比较下一学生
		
SCORE:	LEA	EAX,BUF[EBX]
		MOV	POIN, EAX
		CMP	BUF[EBX][13], 90
		JGE	SCORE1
		CMP	BUF[EBX][13], 80
		JGE	SCORE2
		CMP	BUF[EBX][13], 70
		JGE	SCORE3
		CMP	BUF[EBX][13], 60
		JGE	SCORE4
		JMP	SCORE5
		
SCORE1:	MOV	GRA, 'A'
		JMP	LAST
SCORE2:	MOV	GRA, 'B'
		JMP	LAST
SCORE3:	MOV	GRA, 'C'
		JMP	LAST
SCORE4:	MOV	GRA, 'D'
		JMP	LAST
SCORE5:	MOV	GRA, 'F'
		JMP	LAST
		
NEXTS:	ADD	BX,14
		JMP	SEAR
		
NOTF:	MOV	flag, 0
LAST:
		}
		if (flag == 0)
		{
			printf("not found！\n");
		}
		else 
		{
			printf("%c\n", GRA);
		}
		
	}
	
	return 0 ;
}



