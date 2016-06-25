#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int sear(char*, char*, char*, char*, char*, char*);
extern int ave(unsigned char*);

int main(int argc, char *argv[])
{
	/** 学生成绩缓冲区 **/	
	unsigned char BUF[56] = {'z','d','z',0,0,0,0,0,0,0,78,70,88,0,
						'L','Y','L',0,0,0,0,0,0,0,82,92,90,0,
						'h','u','c','h','a','o',0,0,0,0,99,99,99,0,
						'g','o','n','g','t','o','n','g',0,0,78,100,85 
						};	
	unsigned char *POIN = NULL;		/** 用于保存查找到的学生的成绩表起始地址 **/
	char in_name[10];
	char len_name;
	char flag;
	char SEVEN = 7;
	char GRA;
	ave(BUF);
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
		sear(BUF, in_name, &len_name, POIN, &GRA, &flag);
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

