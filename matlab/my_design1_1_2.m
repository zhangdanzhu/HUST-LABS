%  design1_1.m
T=0.01;  % ȡ������
tx=(-4):T:100;
x=(1-abs(tx)/4).*(heaviside(tx+4)-heaviside(tx-4));
th=(-4):T:100;
h=heaviside(th);
t=(-8):T:200;  % �����ź������������ֽ�β���
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