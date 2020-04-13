figure;  
width=700;   %��ȣ�������
height=400;   %�߶�
left=1000;%����Ļ���½�ˮƽ����
bottem=600;%����Ļ���½Ǵ�ֱ����
set(gcf,'position',[left,bottem,width,height])
Fs=1000;
nfft=10240;
window2=blackman(10000); %blackman��
noverlap=20; %�������ص�
range='onesided'; %Ƶ�ʼ��Ϊ[0 Fs/2]��ֻ����һ���Ƶ��
[PTheta,f]=pwelch(Theta,window2,noverlap,nfft,Fs,range);
plot_PTheta_DB=10*log10(PTheta);
plot(f,plot_PTheta_DB,'b'); 

hold on;
[PTheta_dot,f]=pwelch(Theta_dot,window2,noverlap,nfft,Fs,range);
plot_PTheta_dot_DB=10*log10(PTheta_dot);
plot(f,plot_PTheta_dot_DB,'r'); 
legend('Pitch angle','Pitch rate','Location','northeast');
xlabel({'Frequency (Hz)'},'Interpreter','latex','FontSize',15);
ylabel({'Power Spectrum (dB)'},'Interpreter','latex','FontSize',15);
xlim([0,10]);