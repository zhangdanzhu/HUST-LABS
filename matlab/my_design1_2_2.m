%  my_design1_2_2.m
tmp=0.5;  % ϵ��
ini=2;  % ��ʼֵ
S=['Dy+',num2str(tmp),'*y=heaviside(t-2)'];  % �õ�΢�ַ��̵��ַ������ʽ
init=['y(0)=',num2str(ini)];  % �õ���ʼ�������ַ������ʽ
y=dsolve(S,init,'t');  % ���΢�ַ��̣��õ����Ž�
t=0:0.01:2*pi;
x=ones(1,length(t));  % �õ�ʱ�䷶Χ t �ڵĽ�Ծ�ź� u(t) ����ɢ�������� x
figure
subplot(1,2,1);  % ����ͼ��ʾ����ͼ�ο��Ϊ 1x2 ����ͼ��1����ͼ��ʾ��Ծ�ź� x
plot(t,x)
title('������ѹ');
subplot(1,2,2);  % 2����ͼ��ʾ�����Ӧ ys
ezplot(y,[0,4*pi])
title('�����Ӧ')
