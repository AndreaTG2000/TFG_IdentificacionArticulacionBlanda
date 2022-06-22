load('P50_Y-50_mejorada.mat');

t = mytable_mejorada.Tiempo;

RotationRoll = mytable_mejorada.roll;
RotationPitch = mytable_mejorada.pitch;
RotationYaw = mytable_mejorada.yaw;

m1Position = mytable_mejorada.m1Position;
m2Position = mytable_mejorada.m1Position;
m3Position = mytable_mejorada.m1Position;

figure
plot(t,RotationRoll)

xlabel('time (seconds)')
ylabel('Rotation (Roll)')
grid on
title('Rotation (Roll) vs. time','Data Sensor')

figure
plot(t,RotationPitch)
ylim([0 35])
xlim([0 5])
xlabel('Tiempo (segundos)')
ylabel('Rotación Pitch (grados)')
grid on
title('Rotación Pitch vs. tiempo','Datos Validación')

figure
plot(t,RotationYaw)
ylim([-65 0])
xlabel('Tiempo (segundos)')
ylabel('Rotación Yaw (grados)')
grid on
title('Rotación Yaw vs. tiempo','Datos Validación')

% figure
% plot(t,m1Position)
% xlabel('time (seconds)')
% ylabel('m1Position')
% grid on
% title('m1Position vs. time','Data Sensor')
% 
% figure
% plot(t,m2Position)
% xlabel('time (seconds)')
% ylabel('m2Position')
% grid on
% title('m2Position vs. time','Data Sensor')
% 
% figure
% plot(t,m3Position)
% xlabel('time (seconds)')
% ylabel('m3Position')
% grid on
% title('m3Position vs. time','Data Sensor')
    
clear all
