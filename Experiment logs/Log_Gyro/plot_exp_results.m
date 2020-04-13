% theta tracking errors, all methods, reference 0.2 + 0.05sint rad, 
figure;  
width=700;   %宽度，像素数
height=400;   %高度
left=1000;%距屏幕左下角水平距离
bottem=600;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottem,width,height])
endtime = 100000;
plot(Log_NC_Tracking_Err(1:endtime,1),Log_NC_Tracking_Err(1:endtime,2),'b');
hold on;
plot(Log_KF_Tracking_Err(1:endtime,1),Log_KF_Tracking_Err(1:endtime,2),'g');
hold on;
plot(Log_NE_T5_Tracking_Err(1:endtime,1),Log_NE_T2_Tracking_Err(1:endtime,2),'r');
% hold on;
% plot(Log_NE_T10_Tracking_Err(1:endtime,1),Log_NE_T10_Tracking_Err(1:endtime,2),'Color',[1 0.7 0.0]);
grid on;
xlabel({'time $(s)$'},'Interpreter','latex','FontSize',15);
ylabel({'$\tilde \theta$ $(rad)$'},'Interpreter','latex','FontSize',17);
ylim([-0.25 0.4]);
% gca = legend('without compensation','with LPF (T=0.01)','with KF (Q=0.0001, R=0.01)','with MDE (a1=0.1)',4);
% gca = legend('without compensation','with FDF (LPF)','with KF','with DE',4);
% set( gca, 'Position', [0.68, 0.3, 0.05, 0.02]);    % [10, 50, 100, 400]为显示的位置坐标
legend('without compensation','with KF','with NE (T=2)','Location','southwest');
% subfigure
axes('Position',[0.3,0.53,0.587,0.35]); 
plot(Log_NC_Tracking_Err(1:endtime,1),Log_NC_Tracking_Err(1:endtime,2),'b');
hold on;
plot(Log_KF_Tracking_Err(1:endtime,1),Log_KF_Tracking_Err(1:endtime,2),'g');
hold on;
plot(Log_NE_T5_Tracking_Err(1:endtime,1),Log_NE_T2_Tracking_Err(1:endtime,2),'r');
% hold on;
% plot(Log_NE_T10_Tracking_Err(1:endtime,1),Log_NE_T10_Tracking_Err(1:endtime,2),'Color',[1 0.7 0.0]);
grid on; 
xlim([60 100]);
ylim([-0.03 0.03]);
set(gca,'FontSize',8);%只能同时改变x y轴显示的字体大小;

% theta, all methods, reference 0.2 + 0.05sint rad
figure;  
width=700;   %宽度，像素数
height=400;   %高度
left=1000;%距屏幕左下角水平距离
bottem=600;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottem,width,height])
endtime = 100000;
plot(Log_NC_Theta_Response(1:endtime,1),Log_NC_Theta_Response(1:endtime,2),'k');
hold on;
plot(Log_NC_Theta_Response(1:endtime,1),Log_NC_Theta_Response(1:endtime,4),'b');
hold on;
plot(Log_KF_Theta_Response(1:endtime,1),Log_KF_Theta_Response(1:endtime,4),'g');
hold on;
plot(Log_NE_T5_Theta_Response(1:endtime,1),Log_NE_T2_Theta_Response(1:endtime,4),'r');
% hold on;
% plot(Log_NE_T10_Theta_Response(1:endtime,1),Log_NE_T10_Theta_Response(1:endtime,4),'Color',[1 0.7 0.0]);
grid on;
xlabel({'time $(s)$'},'Interpreter','latex','FontSize',15);
ylabel({'$\theta$ $(rad)$'},'Interpreter','latex','FontSize',17);
% gca = legend('without compensation','with LPF (T=0.01)','with KF (Q=0.0001, R=0.01)','with MDE (a1=0.1)',4);
% gca = legend('without compensation','with FDF (LPF)','with KF','with DE',4);
% set( gca, 'Position', [0.68, 0.3, 0.05, 0.02]);    % [10, 50, 100, 400]为显示的位置坐标
legend('reference','without compensation','with KF','with NE (T=2)','Location','southeast');
% subfigure
% axes('Position',[0.3,0.53,0.587,0.35]); 
% plot(Log_NC_Theta_Response(1:endtime,1),Log_NC_Theta_Response(1:endtime,2),'k');
% hold on;
% plot(Log_NC_Theta_Response(1:endtime,1),Log_NC_Theta_Response(1:endtime,4),'b');
% hold on;
% plot(Log_KF_Theta_Response(1:endtime,1),Log_KF_Theta_Response(1:endtime,4),'g');
% hold on;
% plot(Log_NE_T2_Theta_Response(1:endtime,1),Log_NE_T2_Theta_Response(1:endtime,4),'Color',[1 0.7 0.0]);
% hold on;
% plot(Log_NE_T10_Theta_Response(1:endtime,1),Log_NE_T10_Theta_Response(1:endtime,4),'r');
% grid on; 
% xlim([60 100]);
% ylim([-0.04 0.04]);
% set(gca,'FontSize',8);%只能同时改变x y轴显示的字体大小;

%%
% theta tracking errors, NE, T=10, 5, 2
figure;  
width=700;   %宽度，像素数
height=400;   %高度
left=1000;%距屏幕左下角水平距离
bottem=600;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottem,width,height])
endtime = 100000;
plot(Log_NE_T10_Tracking_Err(1:endtime,1),Log_NE_T10_Tracking_Err(1:endtime,2),'b');
hold on;
plot(Log_NE_T5_Tracking_Err(1:endtime,1),Log_NE_T5_Tracking_Err(1:endtime,2),'g');
hold on;
plot(Log_NE_T2_Tracking_Err(1:endtime,1),Log_NE_T2_Tracking_Err(1:endtime,2),'r');
% hold on;
% plot(Log_NE_T10_Tracking_Err(1:endtime,1),Log_NE_T10_Tracking_Err(1:endtime,2),'Color',[1 0.7 0.0]);
grid on;
xlabel({'time $(s)$'},'Interpreter','latex','FontSize',15);
ylabel({'$\tilde \theta$ $(rad)$'},'Interpreter','latex','FontSize',17);
% gca = legend('without compensation','with LPF (T=0.01)','with KF (Q=0.0001, R=0.01)','with MDE (a1=0.1)',4);
% gca = legend('without compensation','with FDF (LPF)','with KF','with DE',4);
% set( gca, 'Position', [0.68, 0.3, 0.05, 0.02]);    % [10, 50, 100, 400]为显示的位置坐标
legend('with NE (T=10)','with NE (T=5)','with NE (T=2)','Location','southeast');
% subfigure
axes('Position',[0.3,0.53,0.587,0.35]); 
plot(Log_NE_T10_Tracking_Err(1:endtime,1),Log_NE_T10_Tracking_Err(1:endtime,2),'b');
hold on;
plot(Log_NE_T5_Tracking_Err(1:endtime,1),Log_NE_T5_Tracking_Err(1:endtime,2),'g');
hold on;
plot(Log_NE_T2_Tracking_Err(1:endtime,1),Log_NE_T2_Tracking_Err(1:endtime,2),'r');
% hold on;
% plot(Log_NE_T10_Tracking_Err(1:endtime,1),Log_NE_T10_Tracking_Err(1:endtime,2),'Color',[1 0.7 0.0]);
grid on; 
xlim([60 100]);
ylim([-0.03 0.02]);
set(gca,'FontSize',8);%只能同时改变x y轴显示的字体大小;

% theta response, NE, T=10, 5, 2
figure;  
width=700;   %宽度，像素数
height=400;   %高度
left=1000;%距屏幕左下角水平距离
bottem=600;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottem,width,height])
endtime = 100000;
plot(Log_NC_Theta_Response(1:endtime,1),Log_NC_Theta_Response(1:endtime,2),'k');
hold on;
plot(Log_NE_T10_Theta_Response(1:endtime,1),Log_NE_T10_Theta_Response(1:endtime,4),'b');
hold on;
plot(Log_NE_T5_Theta_Response(1:endtime,1),Log_NE_T5_Theta_Response(1:endtime,4),'g');
hold on;
plot(Log_NE_T2_Theta_Response(1:endtime,1),Log_NE_T2_Theta_Response(1:endtime,4),'r');
% hold on;
% plot(Log_NE_T10_Theta_Response(1:endtime,1),Log_NE_T10_Theta_Response(1:endtime,4),'Color',[1 0.7 0.0]);
grid on;
xlabel({'time $(s)$'},'Interpreter','latex','FontSize',15);
ylabel({'$\theta$ $(rad)$'},'Interpreter','latex','FontSize',17);
% gca = legend('without compensation','with LPF (T=0.01)','with KF (Q=0.0001, R=0.01)','with MDE (a1=0.1)',4);
% gca = legend('without compensation','with FDF (LPF)','with KF','with DE',4);
% set( gca, 'Position', [0.68, 0.3, 0.05, 0.02]);    % [10, 50, 100, 400]为显示的位置坐标
legend('reference','with NE (T=10)','with NE (T=5)','with NE (T=2)','Location','southeast');
% subfigure
% axes('Position',[0.3,0.53,0.587,0.35]); 
% plot(Log_NC_Theta_Response(1:endtime,1),Log_NC_Theta_Response(1:endtime,2),'k');
% hold on;
% plot(Log_NC_Theta_Response(1:endtime,1),Log_NC_Theta_Response(1:endtime,4),'b');
% hold on;
% plot(Log_KF_Theta_Response(1:endtime,1),Log_KF_Theta_Response(1:endtime,4),'g');
% hold on;
% plot(Log_NE_T2_Theta_Response(1:endtime,1),Log_NE_T2_Theta_Response(1:endtime,4),'Color',[1 0.7 0.0]);
% hold on;
% plot(Log_NE_T10_Theta_Response(1:endtime,1),Log_NE_T10_Theta_Response(1:endtime,4),'r');
% grid on; 
% xlim([60 100]);
% ylim([-0.04 0.04]);
% set(gca,'FontSize',8);%只能同时改变x y轴显示的字体大小;








































% 
% % Tracking errors, all methods, constant reference, q
% figure;  
% width=700;   %宽度，像素数
% height=400;   %高度
% left=1000;%距屏幕左下角水平距离
% bottem=600;%距屏幕左下角垂直距离
% set(gcf,'position',[left,bottem,width,height])
% endtime = 100000;
% plot(Tracking_err_q_all(1:endtime,1),Tracking_err_q_all(1:endtime,2),'b');
% hold on;
% plot(Tracking_err_q_all(1:endtime,1),Tracking_err_q_all(1:endtime,3),'g');
% hold on;
% plot(Tracking_err_q_all(1:endtime,1),Tracking_err_q_all(1:endtime,4),'Color',[1 0.7 0.0]);
% hold on;
% plot(Tracking_err_q_all(1:endtime,1),Tracking_err_q_all(1:endtime,5),'r');
% grid on;
% xlabel({'time$(s)$'},'Interpreter','latex','FontSize',15);
% ylabel({'$\tilde q$'},'Interpreter','latex','FontSize',17);
% % gca = legend('without compensation','with LPF (T=0.01)','with KF (Q=0.0001, R=0.01)','with MDE (a1=0.1)',4);
% % gca = legend('without compensation','with FDF (LPF)','with KF','with DE',4);
% % set( gca, 'Position', [0.68, 0.3, 0.05, 0.02]);    % [10, 50, 100, 400]为显示的位置坐标
% legend('without compensation','with FDF','with KF','with NE','Location','northeast');
% % subfigure
% axes('Position',[0.3,0.23,0.587,0.35]); 
% plot(Tracking_err_q_all(1:endtime,1),Tracking_err_q_all(1:endtime,2),'b');
% hold on;
% plot(Tracking_err_q_all(1:endtime,1),Tracking_err_q_all(1:endtime,3),'g');
% hold on;
% plot(Tracking_err_q_all(1:endtime,1),Tracking_err_q_all(1:endtime,4),'Color',[1 0.7 0.0]);
% hold on;
% plot(Tracking_err_q_all(1:endtime,1),Tracking_err_q_all(1:endtime,5),'r');
% grid on; 
% xlim([60 100]);
% set(gca,'FontSize',8);%只能同时改变x y轴显示的字体大小；
% 
% 
% 
% 
% 
% % Tracking errors, all methods, constant reference, theta
% figure;  
% width=700;   %宽度，像素数
% height=400;   %高度
% left=1000;%距屏幕左下角水平距离
% bottem=600;%距屏幕左下角垂直距离
% set(gcf,'position',[left,bottem,width,height])
% endtime = 100000;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,2),'b');
% hold on;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,3),'g');
% hold on;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,4),'Color',[1 0.7 0.0]);
% hold on;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,5),'r');
% grid on;
% xlabel({'time$(s)$'},'Interpreter','latex','FontSize',15);
% ylabel({'$\tilde \theta$'},'Interpreter','latex','FontSize',17);
% % gca = legend('without compensation','with LPF (T=0.01)','with KF (Q=0.0001, R=0.01)','with MDE (a1=0.1)',4);
% % gca = legend('without compensation','with FDF (LPF)','with KF','with DE',4);
% % set( gca, 'Position', [0.68, 0.3, 0.05, 0.02]);    % [10, 50, 100, 400]为显示的位置坐标
% legend('without compensation','with NE (T=0.2)','with NE (T=0.1)','with NE (T=0.05)','Location','southeast');
% % subfigure
% axes('Position',[0.3,0.53,0.587,0.35]); 
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,2),'b');
% hold on;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,3),'g');
% hold on;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,4),'Color',[1 0.7 0.0]);
% hold on;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,5),'r');
% grid on; 
% xlim([60 100]);
% set(gca,'FontSize',8);%只能同时改变x y轴显示的字体大小；
% 
% 
% 
% % Tracking errors, all methods, constant reference, q
% figure;  
% width=700;   %宽度，像素数
% height=400;   %高度
% left=1000;%距屏幕左下角水平距离
% bottem=600;%距屏幕左下角垂直距离
% set(gcf,'position',[left,bottem,width,height])
% endtime = 100000;
% plot(Tracking_err_q_all_NE(1:endtime,1),Tracking_err_q_all_NE(1:endtime,2),'b');
% hold on;
% plot(Tracking_err_q_all_NE(1:endtime,1),Tracking_err_q_all_NE(1:endtime,3),'g');
% hold on;
% plot(Tracking_err_q_all_NE(1:endtime,1),Tracking_err_q_all_NE(1:endtime,4),'Color',[1 0.7 0.0]);
% hold on;
% plot(Tracking_err_q_all_NE(1:endtime,1),Tracking_err_q_all_NE(1:endtime,5),'r');
% grid on;
% xlabel({'time$(s)$'},'Interpreter','latex','FontSize',15);
% ylabel({'$\tilde q$'},'Interpreter','latex','FontSize',17);
% % gca = legend('without compensation','with LPF (T=0.01)','with KF (Q=0.0001, R=0.01)','with MDE (a1=0.1)',4);
% % gca = legend('without compensation','with FDF (LPF)','with KF','with DE',4);
% % set( gca, 'Position', [0.68, 0.3, 0.05, 0.02]);    % [10, 50, 100, 400]为显示的位置坐标
% legend('without compensation','with NE (T=0.2)','with NE (T=0.1)','with NE (T=0.05)','northeast');
% % subfigure
% axes('Position',[0.3,0.23,0.587,0.35]); 
% plot(Tracking_err_q_all_NE(1:endtime,1),Tracking_err_q_all_NE(1:endtime,2),'b');
% hold on;
% plot(Tracking_err_q_all_NE(1:endtime,1),Tracking_err_q_all_NE(1:endtime,3),'g');
% hold on;
% plot(Tracking_err_q_all_NE(1:endtime,1),Tracking_err_q_all_NE(1:endtime,4),'Color',[1 0.7 0.0]);
% hold on;
% plot(Tracking_err_q_all_NE(1:endtime,1),Tracking_err_q_all_NE(1:endtime,5),'r');
% grid on; 
% xlim([60 100]);
% set(gca,'FontSize',8);%只能同时改变x y轴显示的字体大小；









% 
% 
% % Tracking errors, DE with different filter parameters, sin reference, actual noise
% figure;  
% width=700;   %宽度，像素数
% height=400;   %高度
% left=1000;%距屏幕左下角水平距离
% bottem=600;%距屏幕左下角垂直距离
% set(gcf,'position',[left,bottem,width,height])
% endtime = 100000;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,2),'b');
% hold on;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,3),'g');
% hold on;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,4),'Color',[1 0.7 0.0]);
% hold on;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,5),'r');
% grid on;
% xlabel({'time$(s)$'},'Interpreter','latex','FontSize',15);
% ylabel({'$\tilde x$'},'Interpreter','latex','FontSize',17);
% legend('without compensation','with NE (T=0.5)','with NE (T=0.2)','with NE (T=0.1)',4);
% % subfigure
% axes('Position',[0.3,0.33,0.587,0.35]); 
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,2),'b');
% hold on;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,3),'g');
% hold on;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,4),'Color',[1 0.7 0.0]);
% hold on;
% plot(Tracking_err_theta_all_NE(1:endtime,1),Tracking_err_theta_all_NE(1:endtime,5),'r');
% grid on; 
% xlim([60 100]);
% % ylim([-20 30]);
% set(gca,'FontSize',8);%只能同时改变x y轴显示的字体大小；
% 
% 
