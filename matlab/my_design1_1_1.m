%  design1_1.m
T=0.01;  % ȡ������
tx=(-1):T:3;
x=exp(-tx).*(heaviside(tx)-heaviside(tx-2));
th=(-1):T:3;
h=2.*(heaviside(th)-heaviside(th-2));
t=(-2):T:6;  % �����ź������������ֽ�β���
y=conv(double(x),double(h)).*T;  % ������
figure
subplot(3,1,1);  % ����ͼ��ʾ����ͼ�ο��Ϊ 3x1 ����ͼ��1����ͼ��ʾ x
plot(tx,x)
ylabel('���뼤��');
subplot(3,1,2);  % 2����ͼ��ʾ h
plot(th,h)
ylabel('��λ�弤��Ӧ');
subplot(3,1,3);  % 3����ͼ��ʾ y
plot(t,y) 
ylabel('�����Ӧ');