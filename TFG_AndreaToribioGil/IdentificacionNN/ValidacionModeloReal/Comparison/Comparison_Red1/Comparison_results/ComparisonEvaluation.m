clc
clear all

errorArray=[];
NNname=table;
NNname_arr=[];
for j=97:114
    i=char(j);
    load(sprintf('Comparison1%c.mat',i));
    load(sprintf('Comparison_rand1%c.mat',i));
    c=comparison;

    for k=1:441
    num(k,1)=k;
    end
    c=sortrows(c,2);

%     PLOTS
    dir='directa';


%     figure
%     plot(num,c.pitchNet,'DisplayName','Net')
%     xlabel('Casos')
%     xticks([])
%     ylabel('Pitch')
%     hold on
%     plot(num,c.pitch,'DisplayName','Real')
%     grid on
%     title(sprintf('ValidationPitch NN1%c',i),dir)
%     legend
%   
%     figure
%     plot(num,c.m1Net,'DisplayName','Net')
%     xlabel('Casos')
%     xticks([])
%     ylabel('M1')
%     hold on
%     plot(num,c.m1,'DisplayName','Real')
%     grid on
%     title(sprintf('ValidationM1 NN1%c',i),dir)
%     legend
% 
%     figure
%     plot(num,c.m2Net,'DisplayName','Net')
%     xlabel('Casos')
%     xticks([])
%     ylabel('M2')
%     hold on
%     plot(num,c.m2,'DisplayName','Real')
%     grid on
%     title(sprintf('ValidationM2 NN1%c',i),dir)
%     legend
% 
%     figure
%     plot(num,c.m3Net,'DisplayName','Net')
%     xlabel('Casos')
%     xticks([])
%     ylabel('M3')
%     hold on
%     plot(num,c.m3,'DisplayName','Real')
%     grid on
%     title(sprintf('ValidationM3 NN1%c',i),dir)
%     legend

%     ERRORS

    errPitch_mse=immse(c.pitch,c.pitchNet);
    errPitch_rmse=sqrt(errPitch_mse);
    errPitch_mae=mae(c.pitch-c.pitchNet);
    
    
    errA=[errPitch_mse errPitch_rmse errPitch_mae];                                     
    errorArray = [errorArray;errA]; 


%     OTHER PLOTS


%     figure
%     plot(c.pitch,c.pitchNet,".")
%     hold on
%     plot(c.pitch,c.pitch)
%     hold off
%     xlabel("Real Pitch")
%     ylabel("Predicted Pitch")
% 
%     figure
%     residuals = c.pitch - c.pitchNet;
%     plot(c.pitch,residuals,".")
%     hold on
%     yline(0)
%     hold off
%     xlabel("Real Pitch")
%     ylabel("Picth Residuals")
  
end

min=min(errorArray,[],1);
errorArray = [errorArray;min];
for k=97:114
    i=char(k);
    NNname_arr=[NNname_arr; sprintf("NN1%c",i)];
end
a="Emin";
NNname_arr=[NNname_arr;a];

NNname=array2table(NNname_arr,'VariableNames',{'NNname'});
errorTable = table;
errorTable = array2table(errorArray,'VariableNames',{'errPitch_mse', 'errPitch_rmse','errPitch_mae'});
errorTable=[NNname errorTable]; 
  
