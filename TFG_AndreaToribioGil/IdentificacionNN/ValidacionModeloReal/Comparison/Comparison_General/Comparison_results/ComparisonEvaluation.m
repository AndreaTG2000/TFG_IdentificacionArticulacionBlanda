clc
clear all

i=4;


load(sprintf('Comparison%d.mat',i));
c=comparison;


for j=1:441
  num(j,1)=j;
end

%PLOTS
if(i==1||i==2||i==3||i==4||i==5||i==6||i==7||i==8)
	dir='directa';        
else
	dir='inversa';
end

if (i == 2||i==3||i == 8||i == 9||i==10||i==12) 
	figure
    plot(num,c.pitchNet,'b','DisplayName','Red')
    xlabel('Casos')
    xticks([])
    ylabel('Pitch (grados)')
    hold on
    plot(num,c.pitch,'r','DisplayName','Real')
    grid on
    title(sprintf('Validación Pitch NN%d',i),'Cada caso es una pareja de alpha y beta')
    legend
    
elseif(i==1||i==7)
    figure
    plot(num,c.pitchTF,'g','DisplayName','TF')
    hold on
    plot(num,c.pitchNet,'b','DisplayName','Red')
    xlabel('Casos')
    xticks([])
    ylabel('Pitch (grados)')
    hold on
    plot(num,c.pitch,'r','DisplayName','Real')
    grid on
    title(sprintf('Validación Pitch NN%d',i),'Cada caso es una pareja de alpha y beta')
    legend
    
end
if (i == 5||i==6||i == 8||i == 9||i==10||i==11)
    figure
    plot(num,c.yawNet,'b','DisplayName','Red')
    xlabel('Casos')
    xticks([])
    ylabel('Yaw (grados)')
    hold on
    plot(num,c.yaw,'r','DisplayName','Real')
    grid on
    title(sprintf('Validación Yaw NN%d',i),'Cada caso es una pareja de alpha y beta')
    legend
    
elseif(i==4||i==7)
    figure
    plot(num,c.yawTF,'g','DisplayName','TF')
    hold on
    plot(num,c.yawNet,'b','DisplayName','Red')
    xlabel('Casos')
    xticks([])
    ylabel('Yaw (grados)')
    hold on
    plot(num,c.yaw,'r','DisplayName','Real')
    grid on
    title(sprintf('Validación Yaw NN%d',i),'Cada caso es una pareja de alpha y beta')
    legend
end
    
figure
plot(num,c.m1Net,'b','DisplayName','Red')
xlabel('Casos')
xticks([])
ylabel('M1 (radianes)')
hold on
plot(num,c.m1,'r','DisplayName','Real')
grid on
title(sprintf('Validación M1 NN%d',i),'Cada caso es una pareja de alpha y beta')
legend
    
figure
plot(num,c.m2Net,'b','DisplayName','Red')
xlabel('Casos')
xticks([])
ylabel('M2 (radianes)')
hold on
plot(num,c.m2,'r','DisplayName','Real')
grid on
title(sprintf('Validación M2 NN%d',i),dir)
legend
    
figure
plot(num,c.m3Net,'b','DisplayName','Red')
xlabel('Casos')
xticks([])
ylabel('M3 (radianes)')
hold on
plot(num,c.m3,'r','DisplayName','Real')
grid on
title(sprintf('Validación M3 NN%d',i),dir)
legend

%ERRORS
if (i == 1||i == 2||i == 3||i == 7||i==8) 
    errPitch_mse=immse(c.pitch,c.pitchNet);
    errPitch_rmse=sqrt(errPitch_mse);
    mean=sum(abs(c.pitch))/441;
    errPitch_nrmse=100*(errPitch_rmse/mean);
    errPitch_mae=mae(c.pitch-c.pitchNet);
    errPitch_nmae=100*(errPitch_mae/mean);
end  

if (i == 1||i == 7) 
    errPitchTF_mse=immse(c.pitch,c.pitchTF);
    errPitchTF_rmse=sqrt(errPitchTF_mse);
    mean=sum(abs(c.pitch))/441;
    errPitchTF_nrmse=100*(errPitchTF_rmse/mean);
    errPitchTF_mae=mae(c.pitch-c.pitchTF);
    errPitchTF_nmae=100*(errPitchTF_mae/mean);
end

if (i == 4||i == 5||i == 6||i == 7||i==8)
    errYaw_mse=immse(c.yaw,c.yawNet);
    errYaw_rmse=sqrt(errYaw_mse);
    mean=sum(abs(c.yaw))/441;
    errYaw_nrmse=100*(errYaw_rmse/mean);
    errYaw_mae=mae(c.yaw-c.yawNet);
    errYaw_nmae=100*(errYaw_mae/mean);
end

if (i == 4||i == 7) 
    errYawTF_mse=immse(c.yaw,c.yawTF);
    errYawTF_rmse=sqrt(errYawTF_mse);
    mean=sum(abs(c.yaw))/441;
    errYawTF_nrmse=100*(errYawTF_rmse/mean);
    errYawTF_mae=mae(c.yaw-c.yawTF);
    errYawTF_nmae=100*(errYawTF_mae/mean);
end

if (i == 9||i == 10||i == 11||i == 12)
    errM1_mse=immse(c.m1,c.m1Net);
    errM1_mae=mae(c.m1,c.m1Net);
    errM1_rmse=sqrt(errM1_mse);
    
    mean1=sum(abs(c.m1))/441;
    errM1_nrmse=100*(errM1_rmse/mean1);
    errM1_nmae=100*(errM1_mae/mean1);
    
    errM2_mse=immse(c.m2,c.m2Net);
    errM2_mae=mae(c.m2,c.m2Net);
    errM2_rmse=sqrt(errM2_mse);
    
    mean2=sum(abs(c.m2))/441;
    errM2_nrmse=100*(errM2_rmse/mean2);
    errM2_nmae=100*(errM2_mae/mean2);
    
    errM3_mse=immse(c.m3,c.m3Net);
    errM3_mae=mae(c.m3,c.m3Net);
    errM3_rmse=sqrt(errM3_mse);
    
    mean3=sum(abs(c.m3))/441;
    errM3_nrmse=100*(errM3_rmse/mean3);
    errM3_nmae=100*(errM3_mae/mean3);
end

%OTHER PLOTS

if (i == 1||i == 2||i == 3||i == 7||i==8) 
    figure
    plot(c.pitch,c.pitchNet,'b.')
    hold on
    plot(c.pitch,c.pitch,'r')
    hold off
    xlabel("Pitch Real (grados)")
    ylabel("Pitch predicho (grados)")
    title(sprintf('Validación Pitch NN%d',i),dir)
    
%     
%     figure
%     residuals = c.pitch - c.pitchNet;
%     plot(c.pitch,residuals,".")
%     hold on
%     yline(0)
%     hold off
%     xlabel("Pitch Real")
%     ylabel("Picth Residuos")
%     title(sprintf('Validación Pitch NN%d',i),dir)
%     
    
%     [~,residualIdx] = sort(residuals,"descend", ...
%     "ComparisonMethod","abs");
%     residuals(residualIdx)
%     c.pitch(residualIdx(1:10),:)
end
if (i == 4||i == 5||i == 6||i == 7||i==8)
    figure
    plot(c.yaw,c.yawNet,'b.')
    hold on
    plot(c.yaw,c.yaw,'r')
    hold off
    xlabel("Yaw Real (grados)")
    ylabel("Yaw predicho (grados)")
    title(sprintf('Validación Yaw NN%d',i),dir)
    
    
%     figure
%     residuals = c.yaw - c.yawNet;
%     plot(c.yaw,residuals,".")
%     hold on
%     yline(0)
%     hold off
%     xlabel("Yaw Real (grados)")
%     ylabel("Yaw Residuos")
%     title(sprintf('Validación Yaw NN%d',i),dir)
    
    
end
if (i == 9||i == 10||i == 11||i == 12)
    figure
    plot(c.m1,c.m1Net,'b.')
    hold on
    plot(c.m1,c.m1,'r')
    hold off
    xlabel("M1 Real (radianes)")
    ylabel("M1 predicho (radianes)")
    title(sprintf('Validación M1 NN%d',i),dir)
    
    
%     figure
%     residuals = c.m1 - c.m1Net;
%     plot(c.m1,residuals,".")
%     hold on
%     yline(0)
%     hold off
%     xlabel("M1 Real (radianes)")
%     ylabel("M1 Residuos")
%     title(sprintf('Validación M1 NN%d',i),dir)
    
    
    figure
    plot(c.m2,c.m2Net,'b.')
    hold on
    plot(c.m2,c.m2,'r')
    hold off
    xlabel("M2 Real (radianes)")
    ylabel("M2 predicho (radianes)")
    title(sprintf('Validación M2 NN%d',i),dir)
    
    
%     figure
%     residuals = c.m2 - c.m2Net;
%     plot(c.m2,residuals,".")
%     hold on
%     yline(0)
%     hold off
%     xlabel("M2 Real")
%     ylabel("M2 Residuos")
%     title(sprintf('Validación M2 NN%d',i),dir)
    
    
    figure
    plot(c.m3,c.m3Net,'b.')
    hold on
    plot(c.m3,c.m3,'r')
    hold off
    xlabel("M3 Real (radianes)")
    ylabel("M3 predicho (radianes)")
    title(sprintf('Validación M3 NN%d',i),dir)
    
%     figure
%     residuals = c.m3 - c.m3Net;
%     plot(c.m3,residuals,".")
%     hold on
%     yline(0)
%     hold off
%     xlabel("M3 Real (radianes)")
%     ylabel("M3 Residuos")
%     title(sprintf('Validación M3 NN%d',i),dir)
    
end
%clear all
    
