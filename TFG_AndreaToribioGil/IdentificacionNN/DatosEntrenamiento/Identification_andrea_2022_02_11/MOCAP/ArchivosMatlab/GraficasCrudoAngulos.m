clc
clear all

load DatosMocap1.mat

Tiempo = DatosMocap1.Time;
Frame = DatosMocap1.Frame;
quaternion = zeros(67281,4);
euler = zeros (67281,3);

for i = 1:67281
    quaternion(i,1) = DatosMocap1.RotationW(i);
    quaternion(i,2) = DatosMocap1.RotationX(i);
    quaternion(i,3) =DatosMocap1.RotationY(i);
    quaternion(i,4) = DatosMocap1.RotationZ(i);
end

euler = quat2eul(quaternion);
Roll = euler(:,1);
Yaw = euler(:,2);
Pitch = euler(:,3);

RotationRoll = (Roll/pi)*180;
RotationPitch = (Pitch/pi)*180;
RotationYaw = (Yaw/pi)*180;

DatosMocap_Euler = table(Frame,Tiempo,RotationRoll,RotationPitch,RotationYaw);
save DatosMocap_Euler

figure
plot(Tiempo,RotationRoll)
xlabel('time (seconds)')
ylabel('Roll (rotation z)')
grid on
title('Roll vs. time','Data Mocap')

figure
plot(Tiempo,RotationPitch)
xlabel('time (seconds)')
ylabel('Pitch (rotation y)')
grid on
title('Pitch vs. time','Data Mocap')

figure
plot(Tiempo,RotationYaw)
xlabel('time (seconds)')
ylabel('Yaw (rotation x)')
grid on
title('Yaw vs. time','Data Mocap')
