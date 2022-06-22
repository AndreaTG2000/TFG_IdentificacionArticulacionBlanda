clc
clear all

load('P-50_Y50_mejorado.mat')
t = mytable_mejorada.Tiempo;

RotationRoll = mytable_mejorada.roll;
RotationPitch = mytable_mejorada.pitch;
RotationYaw = mytable_mejorada.yaw;

m1Position = mytable_mejorada.m1Position;
m2Position = mytable_mejorada.m2Position;
m3Position = mytable_mejorada.m3Position;

m1Velocity = mytable_mejorada.m1Velocity;
m2Velocity = mytable_mejorada.m2Velocity;
m3Velocity = mytable_mejorada.m3Velocity;

m1Amps = mytable_mejorada.m1Amps;
m2Amps = mytable_mejorada.m2Amps;
m3Amps = mytable_mejorada.m3Amps;

cs0=mytable_mejorada.cs0;
cs1=mytable_mejorada.cs1;

% figure
% plot(t,RotationRoll)

% xlabel('time (seconds)')
% ylabel('Rotation (Roll)')
% grid on
% title('Rotation (Roll) vs. time','Data Sensor')

figure
plot(t,RotationPitch)
hold on
plot(t,cs0)
xlabel('tiempo (segundos)')
ylabel('Rotación Pitch (grados)')
grid on
title('Rotación Pitch vs. tiempo','Datos Entrenamiento')

figure
plot(t,RotationYaw)
hold on
plot(t,cs1)
xlabel('tiempo (segundos)')
ylabel('Rotación Yaw (grados)')
grid on
title('Rotación Yaw vs. tiempo','Datos Entrenamiento')

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
% 
% figure
% plot(t,m1Velocity)
% xlabel('time (seconds)')
% ylabel('m1Velocity')
% grid on
% title('m1Velocity vs. time','Data Sensor')
% 
% figure
% plot(t,m2Velocity)
% xlabel('time (seconds)')
% ylabel('m2Velocity')
% grid on
% title('m2Velocity vs. time','Data Sensor')
% 
% figure
% plot(t,m3Velocity)
% xlabel('time (seconds)')
% ylabel('m3Velocity')
% grid on
% title('m3Velocity vs. time','Data Sensor')
% 
% figure
% plot(t,m1Amps)
% xlabel('time (seconds)')
% ylabel('m1Amps')
% grid on
% title('m1Amps vs. time','Data Sensor')
% 
% figure
% plot(t,m2Amps)
% xlabel('time (seconds)')
% ylabel('m2Amps')
% grid on
% title('m2Amps vs. time','Data Sensor')
% 
% figure
% plot(t,m3Amps)
% xlabel('time (seconds)')
% ylabel('m3Amps')
% grid on
% title('m3Amps vs. time','Data Sensor')

    
clear all
