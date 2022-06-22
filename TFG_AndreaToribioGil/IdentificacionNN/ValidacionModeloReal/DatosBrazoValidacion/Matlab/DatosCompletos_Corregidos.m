clc
clear all
big=[];     
bigtable_completa = table;
j=0;
for i = -50:5:50
    for k = -50:5:50
        j=j+1;
        myfilename = sprintf('P%d_Y%d_mejorada.mat',i,k);
        load(myfilename);
        old = table2array(mytable_mejorada);
        
        new(:,1)= old(:,2);    
        new(:,2)= old(:,3); 
        new(:,3)= old(:,7); 
        new(:,4)= old(:,8); 
        new(:,5)= old(:,9); 
        new(:,6)= old(:,4); 
        new(:,7)= old(:,5); 
        new(:,8)= old(:,6); 
        
        big = [big;new];
        
    end
end

bigtable_completa = array2table(big,'VariableNames',{'cs0','cs1','m1Position','m2Position','m3Position','roll','pitch','yaw'});

t = 0:(j*251)-1;
t=t*0.02;
t=t.';

% bigtable_completa.roll = (bigtable_completa.roll/pi)*180;
% bigtable_completa.pitch = (bigtable_completa.pitch/pi)*180;
% bigtable_completa.yaw = (bigtable_completa.yaw/pi)*180;
% 
% bigtable_completa.roll = bigtable_completa.roll-bigtable_completa.roll(1);
% bigtable_completa.pitch = bigtable_completa.pitch-bigtable_completa.pitch(1);
% bigtable_completa.yaw = bigtable_completa.yaw-bigtable_completa.yaw(1);

save('BigTable_completa', 'bigtable_completa')

RotationRoll=bigtable_completa.roll;
RotationPitch=bigtable_completa.pitch;
RotationYaw=bigtable_completa.yaw;
m1Position=bigtable_completa.m1Position;
m2Position=bigtable_completa.m2Position;
m3Position=bigtable_completa.m3Position;

figure
plot(t,RotationRoll)
xlabel('time (seconds)')
ylabel('Rotation (Roll)')
grid on
title('Rotation (Roll) vs. time','Data Sensor')

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
% 
% clear all