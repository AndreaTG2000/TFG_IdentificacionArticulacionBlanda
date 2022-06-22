clc
clear all

   
load('BigTable_Recortada.mat');

num = 1:12221;

RotationRoll = bigtable_recortada.roll;
RotationPitch = bigtable_recortada.pitch;
RotationYaw = bigtable_recortada.yaw;

m1Position = bigtable_recortada.m1Position;
m2Position = bigtable_recortada.m2Position;
m3Position = bigtable_recortada.m3Position;

m1Velocity = bigtable_recortada.m1Velocity;
m2Velocity = bigtable_recortada.m2Velocity;
m3Velocity = bigtable_recortada.m3Velocity;

m1Amps = bigtable_recortada.m1Amps;
m2Amps = bigtable_recortada.m2Amps;
m3Amps = bigtable_recortada.m3Amps;

figure
plot(num,RotationPitch)
xlabel('num')
ylabel('Rotation (Pitch)')
grid on
title('Rotation (Pitch) vs. num','Data Sensor')

figure
plot(num,RotationYaw)
xlabel('num')
ylabel('Rotation (Yaw)')
grid on
title('Rotation (Yaw) vs. num','Data Sensor')

figure
plot(num,m1Position)
xlabel('num')
ylabel('m1Position')
grid on
title('m1Position vs. num','Data Sensor')

figure
plot(num,m2Position)
xlabel('num')
ylabel('m2Position')
grid on
title('m2Position vs. num','Data Sensor')

figure
plot(num,m3Position)
xlabel('num')
ylabel('m3Position')
grid on
title('m3Position vs. num','Data Sensor')


    
clear all