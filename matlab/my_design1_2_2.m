%  my_design1_2_2.m
tmp=0.5;  % 系数
ini=2;  % 初始值
S=['Dy+',num2str(tmp),'*y=heaviside(t-2)'];  % 得到微分方程的字符串表达式
init=['y(0)=',num2str(ini)];  % 得到初始条件的字符串表达式
y=dsolve(S,init,'t');  % 求解微分方程，得到符号解
t=0:0.01:2*pi;
x=ones(1,length(t));  % 得到时间范围 t 内的阶跃信号 u(t) 的离散抽样序列 x
figure
subplot(1,2,1);  % 多子图显示，将图形框分为 1x2 个子图，1号子图显示阶跃信号 x
plot(t,x)
title('激励电压');
subplot(1,2,2);  % 2号子图显示输出响应 ys
ezplot(y,[0,4*pi])
title('输出响应')
