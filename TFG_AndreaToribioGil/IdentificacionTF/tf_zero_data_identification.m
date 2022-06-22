%% Crea las funciones de transferencia a partir de los datos de subida

% System data
s_noise='1';
freq=50;
n_ident=4;


% Identification data
dp=3; % Delay del periodo
np=2; % Numero de polos
no=0; % Numero de zeros

% Preallocating for speed
loop=-50:10:50;
fit_alpha= zeros(1, length(loop));
fit_beta= zeros(1, length(loop));


figure;
tf_alpha=[];
j=0;
bet=0;
% for alp=loop
%     j=j+1;
%     title('Respuesta ante entrada escalón','Funciones de transferencia para el ángulo de pitch')
%     xlabel('Tiempo (segundos)')
%     ylim([-50 40])
%     xlim([0 6])
%     ylabel('Pitch (grados)')
%     [tf1,tf2] = Read_data_identification(alp,bet,s_noise,freq, n_ident, dp,np,no);
% 
%     step(tf1*alp)
%     hold on
%     legend ({'alpha: -50','alpha: -40','alpha: -30','alpha: -20','alpha: -10','alpha: 0','alpha: 10','alpha: 20','alpha: 30','alpha: 40','alpha: 50'},'Location','northeast')
%    
%     tf_alpha=[tf_alpha(:,:),tf1];
%     fit_alpha(j)=tf1.Report.Fit.FitPercent;
% end
tf_beta=[];
j=0;
alp=0;
%figure; % if step
for bet=loop
    j=j+1;
        title('Respuesta ante entrada escalón','Funciones de transferencia para el ángulo de yaw')
    xlabel('Tiempo (segundos)')
    ylim([-50 50])
    xlim([0 6])
    ylabel('Yaw (grados)')
    [tf1,tf2] = Read_data_identification(alp,bet,s_noise,freq, n_ident, dp,np,no);

    step(tf2*bet)
    hold on
    legend ({'beta: -50','beta: -40','beta: -30','beta: -20','beta: -10','beta: 0','beta: 10','beta: 20','beta: 30','beta: 40','beta: 50'},'Location','northeast')


    tf_beta=[tf_beta(:,:),tf2];
    fit_beta(j)=tf2.Report.Fit.FitPercent;
end

[tf_mean_alpha] = tf_mean(tf_alpha);
[tf_mean_beta] = tf_mean(tf_beta);

%% PID y PI
% PID_alpha= pidtune(tf_mean_alpha,'PID');
% PID_beta=pidtune(tf_mean_beta,'PID');
% 
% PI_alpha=pidtune(tf_mean_alpha,'PI');
% PI_beta=pidtune(tf_mean_beta,'PI');
% 
% figure;
% step(feedback(tf_mean_alpha*PI_alpha,1));
% grid on;
% 
% figure;
% step(feedback(tf_mean_beta*PI_beta,1))
% grid on;



%% Fraccionario
% close all
% wsp=1.5; %new gain crossover frequency
% pm=70; %new phase margin
% delay=0;%0.06; %0.08;
% [fPD_alpha,a_alpha,kp_alpha,ka_alpha] = FOController_isom(tf_mean_alpha,wsp,pm,delay);
% [fPD_beta,a_beta,kp_beta,ka_beta] = FOController_isom(tf_mean_beta,wsp,pm,delay);
% figure;
% step(feedback(tf_mean_alpha*fPD_alpha,1));
% grid on;
% title('Alpha: Wsp='+string(wsp)+' Pm='+string(pm))
% figure;
% step(feedback(tf_mean_beta*fPD_beta,1));
% grid on;
% title('Beta: Wsp='+string(wsp)+' Pm='+string(pm))
% 
% 
% FOC_a=[a_alpha,kp_alpha,ka_alpha]
% FOC_b=[a_beta,kp_beta,ka_beta]

%% Gain scheduling 1

% for i=1:11
%     if 0>loop(i)
%         s='m'+string(abs(loop(i)));
%     else
%         s=string(loop(i));
%     end
%     PID.('P'+s)=pidtune(tf_alpha(i),'PID');
%     PID.('Y'+s)=pidtune(tf_beta(i),'PID');
%     PI.('P'+s)=pidtune(tf_alpha(i),'PI');
%     PI.('Y'+s)=pidtune(tf_beta(i),'PI');
% end


