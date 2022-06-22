clc
clear all

load DatosMocap_Euler.mat
load DatosMocap_Euler2.mat
DatosMocap_Euler = table2array(DatosMocap_Euler);
DatosMocap_Euler2 = table2array(DatosMocap_Euler2);
DatosMocap = zeros (67281,5);

for i=1:24407
    DatosMocap(i,1) = DatosMocap_Euler2(i,1);
    DatosMocap(i,2) = DatosMocap_Euler2(i,2);
    DatosMocap(i,3) = DatosMocap_Euler2(i,3);
    DatosMocap(i,4) = DatosMocap_Euler2(i,4);
    DatosMocap(i,5) = DatosMocap_Euler2(i,5);
end

for i=24408:67281
    DatosMocap(i,1) = DatosMocap_Euler(i,1);
    DatosMocap(i,2) = DatosMocap_Euler(i,2);
    DatosMocap(i,3) = DatosMocap_Euler(i,3);
    DatosMocap(i,4) = DatosMocap_Euler(i,4);
    DatosMocap(i,5) = DatosMocap_Euler(i,5);
end

DatosMocap = array2table(DatosMocap,'VariableNames',{'Frame','Tiempo','RotationRoll','RotationPitch','RotationYaw'});
save DatosMocap

figure
plot(DatosMocap.Tiempo,DatosMocap.RotationRoll)
xlabel('time (seconds)')
ylabel('Roll (rotation z)')
grid on
title('Roll vs. time','Data Mocap')

figure
plot(DatosMocap.Tiempo,DatosMocap.RotationPitch)
xlabel('time (seconds)')
ylabel('Pitch (rotation y)')
grid on
title('Pitch vs. time','Data Mocap')

figure
plot(DatosMocap.Tiempo,DatosMocap.RotationYaw)
xlabel('time (seconds)')
ylabel('Yaw (rotation x)')
grid on
title('Yaw vs. time','Data Mocap')
