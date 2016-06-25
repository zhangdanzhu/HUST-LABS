% design6_1.m
figure
colorn='b'

   b=[0.1 -0.3 0.3 -0.1];  % ����ϵ������
   a=[1 0.6 0.4 0.1];  % ��ĸϵ������
   printsys(b,a,'z')
   [Hz,w]=freqz(b,a);
   w=w./pi;
   magh=abs(Hz);
   zerosIndx=find(magh==0);
   magh(zerosIndx)=1;
   magh=20*log10(magh);
   magh(zerosIndx)=-inf;
   angh=angle(Hz);
   angh=unwrap(angh)*180/pi;
   subplot(1,2,1)
   plot(w,magh,colorn);

   subplot(1,2,2)
   plot(w,angh,colorn);


subplot(1,2,1)
xlabel('������Ƶ��(\times\pi rads/sample)')
title('��Ƶ�������� |H(w)| (dB)');


subplot(1,2,2)
xlabel('������Ƶ�� (\times\pi rads/sample)')
title('��Ƶ�������� \theta(w) (degrees)');

