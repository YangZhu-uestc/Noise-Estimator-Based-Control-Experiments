figure;  
width=700;   %宽度，像素数
height=400;   %高度
left=1000;%距屏幕左下角水平距离
bottem=600;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottem,width,height])
Fs=1000;
nfft=10240;
window2=blackman(10000); %blackman窗
noverlap=20; %数据无重叠
range='onesided'; %频率间隔为[0 Fs/2]，只计算一半的频率
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