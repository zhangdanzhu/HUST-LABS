%  my_design1_2_3.m
a=[1,0.5];%分母系数
b=[1];%分子系数
y0=[2];%初始条件
H=[tf(b,a)];%生成系统函数
sys=ss(H);
T=0:0.01:20*pi;
[yzi,t]=initial(sys,y0,T);%产生零输入响应
x=6*ones(1,length(t));%激励函数
yzs=lsim(sys,x,t);%产生零状态响应
y=yzi+yzs;%产生全响应
plot(t,yzi,':',t,yzs,'-.',t,y,'r');
legend('zero input response','zero state response','complete response');