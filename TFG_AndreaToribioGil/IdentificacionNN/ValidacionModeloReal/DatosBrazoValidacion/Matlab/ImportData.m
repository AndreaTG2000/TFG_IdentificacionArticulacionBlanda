clc
clear all

for i = -50:5:50
    for k = -50:5:50
        T=zeros(251,1);
        m=0;
        myfilename = sprintf('Demo_P%d_Y%d.csv',i,k);
        mydata = csvread(myfilename);
        for j=0:0.02:5
            m=m+1;
            T(m,1)=j;
        end
        mydata = [T, mydata];
        mytable = array2table(mydata,'VariableNames',{'Tiempo','alpha','beta','roll','pitch','yaw','m1Position','m2Position','m3Position','cs0','cs1'}); 
        save((sprintf('P%d_Y%d.mat',i,k)), 'mytable')
    end
end

clear all
%     alpha(i)=arr(i,1);
%     beta(i)=arr(i,2);
%     roll(i)=arr(i,3);
%     pitch(i)=arr(i,4);
%     yaw(i)=arr(i,5);
%     pos1(i)=arr(i,6);
%     pos2(i)=arr(i,7);
%     pos3(i)=arr(i,8);
%     cs0(i)=arr(i,9);
%     cs1(i)=arr(i,10);