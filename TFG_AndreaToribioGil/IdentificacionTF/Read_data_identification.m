function [tf1,tf2] = Read_data_identification(i_alpha,i_beta,s_noise,freq, n_ident, dp,np,no)
%{
    %Se procede a la identificación del sistema.

    %DATA EXAMPLE
    % Datos del test
    i_alpha=-50;

    i_beta=50;
    s_noise='1';
    freq=50; %Hz

    %Numero de identificaciones al final del test
    n_ident=4;

    % Identificación pitch
    dp=0; % Delay del periodo
    np=3; % Numero de polos
    no=0; % Numero de zeros
%}

to_zero=1;
s_alpha = string(i_alpha);
s_beta = string(i_beta);

path=strcat('/Users/family/Documents/GitHub/Soft-Arm/graphs/Identificacion/Identificacion_Rand_0-',s_noise,'/Indentificacion_0-',s_noise,'_Rand_P',s_alpha,'_Y',s_beta,'.csv');
re=csvread(path);
arr=re;
period=1/freq; %sec
test=length(arr)-n_ident; % Numero de datos por test
time=period:period:test/freq;


% Preallocating for speed
alpha= zeros(1, test); beta= zeros(1, test);
cs1= zeros(1, test); cs2= zeros(1, test);
pitch= zeros(1, test); roll= zeros(1, test); yaw= zeros(1, test);
pos1= zeros(1, test); pos2= zeros(1, test); pos3= zeros(1, test);
vel1= zeros(1, test); vel2= zeros(1, test); vel3= zeros(1, test);
amp1= zeros(1, test); amp2= zeros(1, test); amp3= zeros(1, test);

for i=1:test %Se asigna el valor de los datos a las variables
    alpha(i)=arr(i,1);
    beta(i)=arr(i,2);
    cs1(i)=arr(i,3);
    cs2(i)=arr(i,4);
    roll(i)=arr(i,5);
    pitch(i)=arr(i,6);
    yaw(i)=arr(i,7);
    pos1(i)=arr(i,8);
    pos2(i)=arr(i,9);
    pos3(i)=arr(i,10);
    vel1(i)=arr(i,11);
    vel2(i)=arr(i,12);
    vel3(i)=arr(i,13);
    amp1(i)=arr(i,14);
    amp2(i)=arr(i,15);
    amp3(i)=arr(i,16);
end

if(to_zero)
    pitch=pitch-pitch(1);
    yaw=yaw-yaw(1);
    roll=roll-roll(1);
end

%% Identificación
% Identificación pitch
idset1=iddata(pitch(1:301)'*180/pi,cs1(1:301)', period);
tf1=tfest(idset1,np,no,dp*period);

% Identificación Yaw
idset2=iddata(yaw(1:301)'*180/pi,cs2(1:301)', period);
tf2=tfest(idset2,np,no,dp*period);

%% PLOTS
 
%     title('Respuesta ante entrada escalón','Funciones de transferencia para el ángulo de pitch')
%     xlabel('Tiempo (segundos)')
%     ylabel('Pitch (grados)')
% if (1)
%     %plot(time(51:301)-1,pitch(51:301)*180/pi);
% 
%     step(tf1*i_alpha)
%     hold on
%     legend ({'alpha: -50','alpha: -40','alpha: -30','alpha: -20','alpha: -10','alpha: 0','alpha: 10','alpha: 20','alpha: 30','alpha: 40','alpha: 50'},'Location','northeast')
%     
    
% end
if (0)
    figure
    step(tf2*i_beta)
    hold on
    %plot(time(51:301)-1,yaw(51:301)*180/pi)
end

if (0) % Mostrar figuras poner 1 o 0 si desea verla o no
    if(0) %Figura entradas
        figure; hold on;
        plot(time,alpha)
        plot(time,beta)
        title('Input: Alpha and Beta')
        legend({'Alpha','Beta'},'Location','southeast')
        xlabel('Time (sec)')
        ylabel('Angle (Degree)')
        ylim([-60 60])
        grid on
    end
    if(0) %Figura entradas ruido
        figure; hold on;
        plot(time,cs1)
        plot(time,cs2)
        title('Input: Alpha and Beta with noise')
        legend({'Alpha','Beta'},'Location','southeast')
        xlabel('Time (sec)')
        ylabel('Angle (Degree)')
        ylim([-60 60])
        grid on
    end
    if(1) %Figura salidas pitch roll yaw
        figure; hold on;
        plot(time,roll*180/pi)
        plot(time,pitch*180/pi)
        plot(time,yaw*180/pi)
        title('Salida: Roll, Pitch, Yaw   Alpha: '+s_alpha+' Beta: '+s_beta)
        legend({'Roll','Pitch','Yaw'},'Location','southeast')
        xlabel('Time (sec)')
        ylabel('Angle (Degree)')
        ylim([-60 60])
        yticks(-60:10:60)
        grid on
    end
    if(0) %Figura salidas posicion motores
        figure; hold on;
        plot(time,pos1*180/pi)
        plot(time,pos2*180/pi)
        plot(time,pos3*180/pi)
        title('Output: Position motors 1, 2 and 3')
        legend({'Motor 1','Motor 2','Motor 3'},'Location','southeast')
        xlabel('Time (sec)')
        ylabel('Angle (Degree)')
    end
    if(0) %Figura salidas velocidad motores
        figure; hold on;
        plot(time,vel1*180/pi)
        plot(time,vel2*180/pi)
        plot(time,vel3*180/pi)
        title('Output: Velocity motors 1, 2 and 3')
        legend({'Motor 1','Motor 2','Motor 3'},'Location','southeast')
        xlabel('Time (sec)')
        ylabel('Velocity (Degree/sec)')
    end
    if(0) %Figura salidas amperios motores
        figure; hold on;
        plot(time,amp1*180/pi)
        plot(time,amp2*180/pi)
        plot(time,amp3*180/pi)
        title('Output: Amps motors 1, 2 and 3')
        legend({'Motor 1','Motor 2','Motor 3'},'Location','southeast')
        xlabel('Time (sec)')
        ylabel('Amps ')
    end
end

%{
        %BAJADA
            % Identificación pitch bajada
    idset1=iddata(pitch(test/2+1:test)'*180/pi,cs1(test/2+1:test)', period);
    tf1=tfest(idset1,np,no,dp*period);

        % Identificación Yaw bajada
    idset2=iddata(yaw(test/2+1:test)'*180/pi,cs2(test/2+1:test)', period);
    tf2=tfest(idset2,np,no,dp*period);
    
    
    step(tf1*i_alpha)
    hold on
    plot(time(51:301)-1,pitch(51:301)*180/pi)
    
    step(tf2*i_beta)
    hold on
    plot(time(51:301)-1,yaw(51:301)*180/pi)
    
%}

end


