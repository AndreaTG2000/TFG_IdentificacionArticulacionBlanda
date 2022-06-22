clc
clear all
big=[];     
bigtable_completa = table;
j=0;
for i = 50:5:50
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

save('BigTable_completa', 'bigtable_completa')

RotationRoll=bigtable_completa.roll;
RotationPitch=bigtable_completa.pitch;
RotationYaw=bigtable_completa.yaw;
m1Position=bigtable_completa.m1Position;
m2Position=bigtable_completa.m2Position;
m3Position=bigtable_completa.m3Position;

figure
plot(t,RotationRoll)
xlabel('time (segundos)')
ylabel('Rotation Roll (grados)')
grid on
title('Rotation (Roll) vs. time','Data Sensor')

figure
plot(t,RotationPitch)
hold on
P=plot(t,RotationPitch,'*');
P.MarkerIndices=176:250:length(RotationPitch);
xlabel('tiempo (segundos)')
ylabel('Rotación Pitch (grados)')
grid on
title('Rotación Pitch vs. tiempo','Datos Validación')

figure
plot(t,RotationYaw)
hold on
P=plot(t,RotationYaw,'*');
P.MarkerIndices=176:250:length(RotationYaw);
xlabel('tiempo (segundos)')
ylabel('Rotación Yaw (grados)')
grid on
title('Rotación Yaw vs. tiempo','Datos Validación')

figure
plot(t,m1Position)
hold on
P=plot(t,m1Position,'*');
P.MarkerIndices=176:250:length(m1Position);
xlabel('tiempo (segundos)')
ylabel('Posición motor m1 (radianes)')
grid on
title('Posición m1 vs. tiempo','Datos Validación')

figure
plot(t,m2Position)
hold on
P=plot(t,m2Position,'*');
P.MarkerIndices=176:250:length(m2Position);
xlabel('tiempo (segundos)')
ylabel('Posición motor m2 (radianes)')
grid on
title('Posición m2 vs. tiempo','Datos Validación')

figure
plot(t,m3Position)
hold on
P=plot(t,m3Position,'*');
P.MarkerIndices=176:250:length(m3Position);
xlabel('tiempo (segundos)')
ylabel('Posición motor m3 (radianes)')
grid on
title('Posición m3 vs. tiempo','Datos Validación')
% 
% clear all