
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load noise_zacc;
load noise_yacc;
load noise_zGPS;
load noise_pitch_ahrs;



%% Quanser Aero Parameters
% Moment of Inertia of helicopter body (kg-m^2)
L_body = 6.5*0.0254; % length of horizontal body (metal tube)
m_body = 0.094; % mass of horizontal body (metal tube) 
J_body = m_body * L_body^2 / 12; % horizontal cylinder rotating about CM
% 
% Moment of Inertia of yoke fork that rotates about yaw axis (kg-m^2)
m_yoke = 0.526; % mass of entire yoke assembly (kg)
% h_yoke = 9*0.0254; % height of yoke assembly (m)
r_fork = 0.04/2; % radius of each fork (approximated as cylinder)
J_yoke = 0.5*m_yoke*r_fork^2;
% 
% Moment of Inertia from motor + guard assembly about pivot (kg-m^2)
m_prop = 0.43; % mass of dc motor + shield + propeller shield
% m_motor = 0.203; % mass of dc motor
r_prop = 6.25*0.0254; % distance from CM to center of pitch axis
J_prop = m_prop * r_prop^2; % using parallel axis theorem
% 
% Equivalent Moment of Inertia about Pitch and Yaw Axis (kg-m^2)
Jp = J_body + 2*J_prop; % pitch: body and 2 props
Jy = J_body + 2*J_prop + J_yoke; % yaw: body, 2 props, and yoke
%
% Thrust-torque constant (N-m/V) [found experimentally]
Kpp = 0.0011; % (pre-production unit: 0.0015)
Kyy = 0.0022; % (pre-production unit: 0.0040)
Kpy = 0.0021; % thrust acting on pitch from yaw (pre-production unit: 0.0020)
Kyp = -0.0027; % thrust acting on yaw from pitch (pre-production unit: -0.0017)
% 
% Stiffness (N-m/rad)[found experimentally] 
Ksp = 0.037463;
% 
% Viscous damping (N-m-s/rad) [found experimentally]
Dp = 0.0071116; % pitch axis (pre-production unit: Dp = 0.0226) 
Dy = 0.0220; % yaw axis (pre-production unit: Dy = 0.0211)


%======================================================
% new system parameters calculated from experiment
% Dp larger-phase shift to the left
% Ksp larger-larger frequency, smaller period
% Kpp larger-lower steady-state response (final value)


% Raw
% Dp = 0.001726360314880;
% Ksp = 0.066336369824445;
% Kpp = 9.8569e-04;

% need to test more to build the function of tao = f(Vp).
% %good for const 0.55
% Taop = 0.039403803675721;
% Ksp = 0.071643279410402;
% Kpp = 0.001674909508142;
% Dp = 0.006473851180800; 
% Vp = 23.525929898998020;

% %good for const 0.5
% Taop = 0.035821639705201;
% Ksp = 0.071643279410402;
% Kpp = 0.001574592236740;
% Dp = 0.006473851180800; 
% Vp = 22.749788084422534;

% %good for const 0.45
% Taop = 0.032239475734681;
% Ksp = 0.071643279410402;
% Kpp = 0.001483980393889;
% Dp = 0.006473851180800; 
% Vp = 21.725001130362370;

% %good for const 0.4
% Taop = 0.028657311764161;
% Ksp = 0.071643279410402;
% Kpp = 0.001424712359725;
% Dp = 0.006473851180800; 
% Vp = 20.114454379892990;

% %good for const 0.35
% Taop = 0.025075147793641;
% Ksp = 0.071643279410402;
% Kpp = 0.001333850465982;
% Dp = 0.006473851180800; 
% Vp = 18.799069635722105;

% %good for const 0.3
% Taop = 0.021492983823121;
% Ksp = 0.071643279410402;
% Kpp = 0.001224486905748;
% Dp = 0.006473851180800 * 0.95; 
% Vp = 17.552644885152944;

% %good for const 0.275
% Taop = 0.019701901837861;
% Ksp = 0.071643279410402;
% Kpp = 0.001179750757041;
% Dp = 0.006473851180800; 
% Vp = 16.700054414269680;

% %good for const 0.25
% Taop = 0.017910819852601;
% Ksp = 0.071643279410402;
% Kpp = 0.001116072144750;
% Dp = 0.006473851180800; 
% Vp = 16.048084289938550;

% %good for const 0.24
% Taop = 0.017194387058496;
% Ksp = 0.071643279410402;
% Kpp = 0.001085714982413;
% Dp = 0.006473851180800; 
% Vp = 15.836925286123568;

% %good for const 0.23
% Taop = 0.016477954264392;
% Ksp = 0.071643279410402;
% Kpp = 0.001066855027454;
% Dp = 0.006473851180800; 
% Vp = 15.445354654903651;

% %good for const 0.225
% Taop = 0.016119737867340;
% Ksp = 0.071643279410402;
% Kpp = 0.001063362372000;
% Dp = 0.006905441259520; 
% Vp = 15.159214104051866;

% %good for const 0.22
% Taop = 0.015761521470288;
% Ksp = 0.071643279410402;
% Kpp = 0.001040447724794;
% Dp = 0.006473851180800; 
% Vp = 15.148787483202787;

% %good for const 0.21
% Taop = 0.015045088676184;
% Ksp = 0.071643279410402;
% Kpp = 0.001014436531674;
% Dp = 0.006473851180800; 
% Vp = 14.830980752788083;

% %good for const 0.2
Taop = 0.014328655882080;
Ksp = 0.071643279410402;
Kpp = 9.971955650940002e-04;
Dp = 0.007768621416960; 
Vp = 14.368952674523491;

% %good for const 0.19
% Taop = 0.013612223087976;
% Ksp = 0.071643279410402;
% Kpp = 9.602993291855222e-04;
% Dp = 0.007768621416960; 
% Vp = 14.174979273932832;

% %good for const 0.18
% Taop = 0.012895790293872;
% Ksp = 0.071643279410402;
% Kpp = 9.238079546764723e-04;
% Dp = 0.007768621416960; 
% Vp = 13.959384338045243;

% %good for const 0.175
% Taop = 0.012537573896820;
% Ksp = 0.071643279410402;
% Kpp = 9.211376547450001e-04;
% Dp = 0.009322345700352; 
% Vp = 13.610966647858016;

% %good for const 0.17
% Taop = 0.012179357499768;
% Ksp = 0.071643279410402;
% Kpp = 9.121980905868709e-04;
% Dp = 0.007768621416960; 
% Vp = 13.351658620478627;

% %good for const 0.16
% Taop = 0.011462924705664;
% Ksp = 0.071643279410402;
% Kpp = 8.806088470998911e-04;
% Dp = 0.007768621416960; 
% Vp = 13.017044677004060;

% %good for const 0.15
% Taop = 0.010746491911560;
% Ksp = 0.071643279410402;
% Kpp = 8.475731458200002e-04;
% Dp = 0.009926571810560; 
% Vp = 12.679132136924192;

% %good for const 0.125
% Taop = 0.008955409926300;
% Ksp = 0.071643279410402;
% Kpp = 7.752920052750001e-04;
% Dp = 0.010789751968000; 
% Vp = 11.551015443689142;

% %good for const 0.1
% Taop = 0.007164327941040;
% Ksp = 0.071643279410402;
% Kpp = 7.019108346900002e-04;
% Dp = 0.010789751968000; 
% Vp = 10.206891797309746;

% %good for const 0.075
% Taop = 0.005373245955780;
% Ksp = 0.071643279410402;
% Kpp = 5.786616356250001e-04;
% Dp = 0.011221342046720; 
% Vp = 9.285644018851570;

% %good for const 0.05
% Taop = 0.003582163970520;
% Ksp = 0.071643279410402;
% Kpp = 4.910534098560001e-04;
% Dp = 0.019853143621120; 
% Vp = 7.294856116711537;

% first fitting
% Taop_all = [0.003582163970520; 0.005373245955780; 0.007164327941040; 0.008955409926300; 0.010746491911560; 0.012537573896820; 0.014328655882080; 0.016119737867340; 0.017910819852601];
% Kpp_all = [4.950135180000002e-04; 5.729323125000001e-04; 7.104360675000002e-04; 7.791879450000001e-04; 8.433563640000002e-04; 9.304420755000001e-04; 9.991939530000003e-04; 0.001063362372000; 0.001116072144750;];
% plot(Taop_all, Kpp_all);
% hold on;
%fitting
% p1 =      -1.027;
% p2 =     0.06566;
% p3 =   0.0002694;
% Kpp_est = p1 * Taop_all .* Taop_all + p2 * Taop_all + p3;
% plot(Taop_all, Kpp_est);

% second fitting (more accurate)
Taop_all = [0;
    0.003582163970520;
    0.005373245955780;
    0.007164327941040;
    0.008955409926300;
    0.010746491911560;
    0.011462924705664;
    0.012179357499768;
    0.012537573896820;
    0.012895790293872;
    0.013612223087976;
    0.014328655882080;
    0.015045088676184;
    0.015761521470288;
    0.016119737867340;
    0.016477954264392;
    0.017194387058496;
    0.017910819852601;
    0.019701901837861;
    0.021492983823121;
    0.025075147793641;
    0.028657311764161;
    0.032239475734681;
    0.035821639705201;
    0.039403803675721;];
Vp_all = [0;
    7.294856116711537;
    9.285644018851570;
    10.206891797309746;
    11.551015443689142;
    12.679132136924192;
    13.017044677004060;
    13.351658620478627;
    13.610966647858016;
    13.959384338045243;
    14.174979273932832;
    14.368952674523491;
    14.830980752788083;
    15.148787483202787;
    15.159214104051866;
    15.445354654903651;
    15.836925286123568;
    16.048084289938550;
    16.700054414269680;
    17.552644885152944;
    18.799069635722105;
    20.114454379892990;
    21.725001130362370;
    22.749788084422534;
    23.525929898998020;];
 weights = [1,0.200000000000000,0.100000000000000,0.200000000000000,0.500000000000000,1,1.20000000000000,1.50000000000000,1.50000000000000,2,2,2,2,1.50000000000000,1.50000000000000,1.20000000000000,1.20000000000000,1,0.600000000000000,0.400000000000000,0.200000000000000,0.100000000000000,0.100000000000000,0.100000000000000,0.100000000000000]
% %fitting1
% Vp =  p1*Taop^4 + p2*Taop^3 + p3*Taop^2 + p4*Taop + p5;
% p1 =  -1.635e+07; % (-2.239e+07, -1.032e+07)
% p2 =   1.582e+06; % (1.067e+06, 2.096e+06)
% p3 =  -5.763e+04; % (-7.245e+04, -4.28e+04)
% p4 =        1330; % (1164, 1495)
% p5 =       3.291; % (2.694, 3.888)
% %fitting2
% Vp = (a*Taop + b)*sqrt(Taop)
% a =      -83.12; % (-131.5, -34.76)
% b =       122.1; % (120.9, 123.3)

%good for 0.2+0.01sint 
% Dp = 0.001726360314880;
% Ksp = 0.066336369824445;
% Kpp = 9.8569e-04;
% Ksp = Ksp * 1.07;
% Kpp = Kpp * 1.01;
% Dp = Dp * 5;   


% %good for 0.2+0.02sint 
% Ksp = 0.033168184912223;
% Kpp = 4.583458500000001e-04;
% Dp = 0.008631801574400;   

% good for 0.2+0.05sint 
% Ksp = 0.031509775666612;
% Kpp = 4.377202867500001e-04;
% Dp = 0.004315900787200;   

% % good for 0.1+0.05sint 
% % Ksp_ff = 0.031509775666612  * 1.05;
% % Kpp = 4.377202867500001e-04 * 0.72;
% % Dp_ff = 0.004315900787200  * 1.05;  



% Jp_ff = 0.021886864828333;
% Jp_ff = Jp_ff * 1;
% Ksp_ff = Ksp_ff * 1.05;
% Kpp = Kpp * 0.91;
% Dp_ff = Dp_ff * 1.25;
% 
% Jp = Jp_ff;
% Ksp = Ksp_ff;
% Dp = Dp_ff;



% Dp = Dp * 4.9;
% Ksp = Ksp * 1.1;
% Kpp = Kpp * 1.075;
% Dp = Dp * 8.8;

 
 
 
% Dp = Dp * 3.6;
Dp_static = Dp*0.05;
%======================================================




% state-space matrices
% x =[theta;psi;theta_dot;psi_dot]
A = [0 0 1 0;
    0 0 0 1;
    -Ksp/Jp 0 -Dp/Jp 0;
    0 0 0 -Dy/Jy];
B = [0 0;
    0 0;
    Kpp/Jp Kpy/Jp;
    Kyp/Jy Kyy/Jy];
C = eye(2,4);
D = zeros(2,2);
% state-space matrices for pitch channel (yaw locked, yaw motor disabled)
% xp =[theta;theta_dot] Vy==0  yp=[theta;theta_dot]  u=taop
A_p = [0 1;
    -Ksp/Jp -Dp/Jp];
B_p = [0;
    1/Jp];
C_p = [1 0;0 1];
D_p = [0;0];






%% channel selection
% yaw locked, yaw motor disabled
PitchMotorEnable = 1;
PitchAxisEnable = 1;
YawMotorEnable = 0;
YawAxisEnable = 0;



%% controller output feedback gain
%  k1 + Ksp > 0
%  k2 + Dp > 0
%  Ksp*Dp*T^2 + (Dp^2 - Jp*k1 + Dp*k2)*T + Jp*(Dp + k2) > 0

% k1 = 0.05;   %good for const ref 
% k2 = 0.05;

% k1 = 0.1;   % good for 0.2 + 0.05 sint
% k2 = 0.05;
% 
% k1 = 0.1;   % good for 0.2 + 0.05 sint
% k2 = 0.05;
% 
k1 = 0.1;   % good for 0.2 + 0.05 sint  theta_acc/theta_gyro
k2 = 0.05;


 
% % % % % % % Gfs_bar parameters

T= 2; 
Invalid_T = 0;
if (Ksp*Dp*T^2 + (Dp^2 - Jp*k1 + Dp*k2)*T + Jp*(Dp + k2) <= 0)
    Invalid_T = 1;
    disp('Invalid T!')
end
PolyDen = [Jp*T (T*Dp+Jp) (T*Ksp+Dp+k2) (Ksp+k1)];
r = roots(PolyDen);




%% Estimator transfer function matrix G_bar(s)
G_bar_D = [(Jp*T^2) (T^2*Dp+2*Jp*T) (T^2*Ksp+2*T*Dp+T*k2+Jp) (2*T*Ksp+T*k1+Dp+k2) (Ksp+k1)];
G_bar_N11 = [(Jp*T) (T*Dp+Jp) (T*Ksp+Dp+k2) Ksp];
G_bar_N12 = [-k2];
G_bar_N21 = [-k1 0];
G_bar_N22 = [(Jp*T) (T*Dp+Jp) (T*Ksp+Dp) (Ksp+k1)];



% % % % % % % vehicle initial conditions
theta_initial = 0.0;   %in rad
theta_dot_initial = 0.0;
psi_initial = 0.0;    %in rad
psi_dot_initial = 0.0;
