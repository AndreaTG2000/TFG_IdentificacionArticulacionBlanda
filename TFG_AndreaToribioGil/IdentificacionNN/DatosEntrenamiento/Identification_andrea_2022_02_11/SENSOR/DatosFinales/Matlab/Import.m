
for i = -50:10:50
    for k = -50:10:50
        myfilename = sprintf('P%d_Y%d.xlsx',i,k);
        mydata = xlsread(myfilename,'A2:Q553');
        mytable = array2table(mydata,'VariableNames',{'Tiempo','cs0','cs1','csr0','csr1','roll','pitch','yaw','m1Position','m2Position','m3Position','m1Velocity','m2Velocity','m3Velocity','m1Amps','m2Amps','m3Amps'}); 
        save((sprintf('P%d_Y%d.mat',i,k)), 'mytable')
    end
end

clear all
