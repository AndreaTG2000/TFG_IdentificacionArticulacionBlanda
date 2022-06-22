clc
clear all

   
load('BigTable.mat');

t = bigtable.Tiempo;

RotationRoll = bigtable.roll;
RotationPitch = bigtable.pitch;
RotationYaw = bigtable.yaw;

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
plot(t,RotationPitch)
xlabel('time (seconds)')
ylabel('Rotation (Pitch)')
grid on
title('Rotation (Pitch) vs. time','Data Sensor')

figure
plot(t,RotationYaw)
xlabel('time (seconds)')
ylabel('Rotation (Yaw)')
grid on
title('Rotation (Yaw) vs. time','Data Sensor')

figure
plot(t,m1Position)
xlabel('time (seconds)')
ylabel('m1Position')
grid on
title('m1Position vs. time','Data Sensor')

figure
plot(t,m2Position)
xlabel('time (seconds)')
ylabel('m2Position')
grid on
title('m2Position vs. time','Data Sensor')

figure
plot(t,m3Position)
xlabel('time (seconds)')
ylabel('m3Position')
grid on
title('m3Position vs. time','Data Sensor')

figure
plot(t,m1Velocity)
xlabel('time (seconds)')
ylabel('m1Velocity')
grid on
title('m1Velocity vs. time','Data Sensor')

figure
plot(t,m2Velocity)
xlabel('time (seconds)')
ylabel('m2Velocity')
grid on
title('m2Velocity vs. time','Data Sensor')

figure
plot(t,m3Velocity)
xlabel('time (seconds)')
ylabel('m3Velocity')
grid on
title('m3Velocity vs. time','Data Sensor')

figure
plot(t,m1Amps)
xlabel('time (seconds)')
ylabel('m1Amps')
grid on
title('m1Amps vs. time','Data Sensor')

figure
plot(t,m2Amps)
xlabel('time (seconds)')
ylabel('m2Amps')
grid on
title('m2Amps vs. time','Data Sensor')

figure
plot(t,m3Amps)
xlabel('time (seconds)')
ylabel('m3Amps')
grid on
title('m3Amps vs. time','Data Sensor')

    
clear all
