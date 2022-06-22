clc
clear all

i=1;
ciclo="ciclo_alpha";
al=-50;
be=-50;
erased=0;

load(sprintf('Comparison%d.mat',i));
c=comparison;

for j=1:441
    j=j-erased;
    if(ciclo=="ciclo_alpha")
        if (c.alpha(j)==al)
            num(j,1)=j;
        else
            c(j,:)=[];
            erased=erased+1;
        end
    elseif(ciclo=="ciclo_beta")
        if (c.beta(j)==be)
            num(j,1)=j;
        else
            c(j,:)=[];
            erased=erased+1;
        end
    end
end

%PLOTS
if(i==1||i==2||i==3||i==5||i==6||i==7||i==9||i==11)
	dir='directa';
%     for k=295:1:315
%         k;
%         c(295,:)=[];
%         num(295,:)=[];
%     end
        
else
	dir='inversa';
end
if (i == 3||i == 7||i==4||i==8||i == 1||i == 5||i==11||i==12) 
	figure
    plot(num,c.pitchNet,'b','DisplayName','Red')
    xlabel('Casos')
    xticks([])
    ylabel('Pitch (grados)')
    hold on
    plot(num,c.pitch,'r','DisplayName','Real')
    grid on
    title(sprintf('Validación Pitch NN%d',i),'Cada caso es una pareja de alpha (en este caso siempre -50) y beta')
    legend

end
if (i == 3||i == 7||i==4||i==8||i == 2||i == 6||i==9||i==10)
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
plot(num,c.m2Net,'DisplayName','Red')
xlabel('Casos')
xticks([])
ylabel('M2 (radianes)')
hold on
plot(num,c.m2,'DisplayName','Real')
grid on
title(sprintf('Validación M2 NN%d',i),'Cada caso es una pareja de alpha y beta')
legend
    
figure
plot(num,c.m3Net,'b','DisplayName','Red')
xlabel('Casos')
xticks([])
ylabel('M3 (radianes)')
hold on
plot(num,c.m3,'r','DisplayName','Real')
grid on
title(sprintf('Validación M3 NN%d',i),'Cada caso es una pareja de alpha y beta')
legend

%ERRORS
if (i == 3||i == 7||i == 1||i == 5||i==11) 
    errPitch_mse=immse(c.pitch,c.pitchNet);
    errPitch_rmse=sqrt(errPitch_mse);
    errPitch_mae=mae(c.pitch-c.pitchNet);
end
if (i == 3||i == 7||i == 2||i == 6||i==9)
    errYaw_mse=immse(c.yaw,c.yawNet);
    errYaw_rmse=sqrt(errYaw_mse);
    errYaw_mae=mae(c.yaw-c.yawNet);
end
if (i == 4||i == 8||i == 10||i == 12)
    errM1_mse=immse(c.m1,c.m1Net);
    errM1_mae=mae(c.m1,c.m1Net);
    errM1_rmse=sqrt(errM1_mse);
    
    errM2_mse=immse(c.m2,c.m2Net);
    errM2_mae=mae(c.m2,c.m2Net);
    errM2_rmse=sqrt(errM2_mse);
    
    errM3_mse=immse(c.m3,c.m3Net);
    errM3_mae=mae(c.m3,c.m3Net);
    errM3_rmse=sqrt(errM3_mse);
end

%OTHER PLOTS
% 
% if (i == 3||i == 7||i == 1||i == 5||i==11) 
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
%     xlabel("Real Pitch)")
%     ylabel("Picth Residuals")
%     
% %     [~,residualIdx] = sort(residuals,"descend", ...
% %     "ComparisonMethod","abs");
% %     residuals(residualIdx)
% %     c.pitch(residualIdx(1:10),:)
% end
% if (i == 3||i == 7||i == 2||i == 6||i==9)
%     figure
%     plot(c.yaw,c.yawNet,".")
%     hold on
%     plot(c.yaw,c.yaw)
%     hold off
%     xlabel("Real Yaw")
%     ylabel("Predicted Yaw")
%     
%     figure
%     residuals = c.yaw - c.yawNet;
%     plot(c.yaw,residuals,".")
%     hold on
%     yline(0)
%     hold off
%     xlabel("Real Yaw)")
%     ylabel("Yaw Residuals")
%     
% end
% if (i == 4||i == 8||i == 10||i == 12)
%     figure
%     plot(c.m1,c.m1Net,".")
%     hold on
%     plot(c.m1,c.m1)
%     hold off
%     xlabel("Real M1")
%     ylabel("Predicted M1")
%     
%     figure
%     residuals = c.m1 - c.m1Net;
%     plot(c.m1,residuals,".")
%     hold on
%     yline(0)
%     hold off
%     xlabel("Real M1)")
%     ylabel("M1 Residuals")
%     
%     figure
%     plot(c.m2,c.m2Net,".")
%     hold on
%     plot(c.m2,c.m2)
%     hold off
%     xlabel("Real M2")
%     ylabel("Predicted M2")
%     
%     figure
%     residuals = c.m2 - c.m2Net;
%     plot(c.m2,residuals,".")
%     hold on
%     yline(0)
%     hold off
%     xlabel("Real M2)")
%     ylabel("M2 Residuals")
%     
%     figure
%     plot(c.m3,c.m3Net,".")
%     hold on
%     plot(c.m3,c.m3)
%     hold off
%     xlabel("Real M3")
%     ylabel("Predicted M3")
%     
%     figure
%     residuals = c.m3 - c.m3Net;
%     plot(c.m3,residuals,".")
%     hold on
%     yline(0)
%     hold off
%     xlabel("Real M3)")
%     ylabel("M3 Residuals")
% end
% % clear all    
