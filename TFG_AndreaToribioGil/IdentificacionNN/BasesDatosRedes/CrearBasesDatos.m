clc
clear all

load('BigTable_Rand.mat');

k=1;
l=1;
m=1;

complete = table2array(randx);

for i = 1:12221
    if complete(i,2)==0 %cs0=referencia de Pitch=0
        for j = 1:17
            p0(k,j)= complete(i,j);
            p0ory0(m,j)= complete(i,j);
        end
        k=k+1;
        m=m+1;
    end
    if complete(i,3)==0 %cs1=referencia de Yaw=0
        for j = 1:17
            y0(l,j)= complete(i,j);
            p0ory0(m,j)= complete(i,j);
        end
        l=l+1;
        m=m+1;
    end
end       

bigtable_p0 = array2table(p0,'VariableNames',{'Tiempo','cs0','cs1','csr0','csr1','roll','pitch','yaw','m1Position','m2Position','m3Position','m1Velocity','m2Velocity','m3Velocity','m1Amps','m2Amps','m3Amps'});
bigtable_y0 = array2table(y0,'VariableNames',{'Tiempo','cs0','cs1','csr0','csr1','roll','pitch','yaw','m1Position','m2Position','m3Position','m1Velocity','m2Velocity','m3Velocity','m1Amps','m2Amps','m3Amps'});
bigtable_p0ory0 = array2table(p0ory0,'VariableNames',{'Tiempo','cs0','cs1','csr0','csr1','roll','pitch','yaw','m1Position','m2Position','m3Position','m1Velocity','m2Velocity','m3Velocity','m1Amps','m2Amps','m3Amps'});
save('BigTable_P0.mat','bigtable_p0')
save('BigTable_Y0.mat','bigtable_y0')
save('BigTable_P0orY0.mat','bigtable_p0ory0')


clear all
