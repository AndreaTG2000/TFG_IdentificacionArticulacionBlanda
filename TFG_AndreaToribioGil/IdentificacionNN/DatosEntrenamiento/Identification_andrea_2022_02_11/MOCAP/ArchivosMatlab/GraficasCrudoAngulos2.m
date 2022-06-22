clc
clear all

load DatosMocap2.mat

Tiempo = DatosMocap2.Time;
Frame = DatosMocap2.Frame;
quaternion = zeros(24407,4);
euler = zeros (24407,3);

for i = 1:24407
    quaternion(i,1) = DatosMocap2.RotationW(i);
    quaternion(i,2) = DatosMocap2.RotationX(i);
    quaternion(i,3) =DatosMocap2.RotationY(i);
    quaternion(i,4) = DatosMocap2.RotationZ(i);
end

euler = quat2eul(quaternion);
Roll = euler(:,1);
Yaw = euler(:,2);
Pitch = euler(:,3);

RotationRoll = (Roll/pi)*180;
RotationPitch = (Pitch/pi)*180;
RotationYaw = (Yaw/pi)*180;

DatosMocap_Euler2 = table(Frame,Tiempo,RotationRoll,RotationPitch,RotationYaw);
save DatosMocap_Euler2  

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