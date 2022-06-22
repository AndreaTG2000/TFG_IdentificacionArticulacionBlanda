clc
clear all

   
load('BigTable.mat');

t = bigtable.Tiempo;

RotationRoll = (bigtable.roll/pi)*180;
RotationPitch = (bigtable.pitch/pi)*180;
RotationYaw = (bigtable.yaw/pi)*180;

m1Position = bigtable.m1Position;
m2Position = bigtable.m2Position;
m3Position = bigtable.m3Position;

m1Velocity = bigtable.m1Velocity;
m2Velocity = bigtable.m2Velocity;
m3Velocity = bigtable.m3Velocity;

m1Amps = bigtable.m1Amps;
m2Amps = bigtable.m2Amps;
m3Amps = bigtable.m3Amps;

figure
plot(t,RotationRoll)
xlabel('tiempo (segundos)')
ylabel('Rotación Roll (grados)')
grid on
title('Rotación Roll vs. tiempo','Datos Entrenamiento (sin corregir)')

figure
plot(t,RotationPitch)
xlabel('tiempo (segundos)')
ylabel('Rotación Pitch (grados)')
grid on
title('Rotación Pitch vs. tiempo','Datos Entrenamiento (sin corregir)')

figure
plot(t,RotationYaw)
xlabel('tiempo (segundos)')
ylabel('Rotación Yaw (grados)')
grid on
title('Rotación Yaw vs. tiempo','Datos Entrenamiento (sin corregir)')

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
