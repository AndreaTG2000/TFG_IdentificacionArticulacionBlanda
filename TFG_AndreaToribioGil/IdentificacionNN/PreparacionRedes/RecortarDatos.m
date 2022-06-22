clc
clear all

load('BigTable.mat');
bigtable_recortada = table;

for i = 50:-10:-50
    for k = -50:10:50
        load (sprintf('P%d_Y%d_mejorado.mat',i,k));
        old = table2array(mytable_mejorada);
        for j=201:301 %Guarda los valores entre 4 y 6 segundos en la nueva tabla
            for l = 1:17
                new(j-200,l)= old(j,l);                
            end
        end
        mytable_recortada = array2table(new,'VariableNames',{'Tiempo','cs0','cs1','csr0','csr1','roll','pitch','yaw','m1Position','m2Position','m3Position','m1Velocity','m2Velocity','m3Velocity','m1Amps','m2Amps','m3Amps'});
        save((sprintf('P%d_Y%d_recortado.mat',i,k)),'mytable_recortada')
        bigtable_recortada = [bigtable_recortada;mytable_recortada]; 
        clear mytable_mejorada
        clear mytable_recortada
    end
end       
       
save('BigTable_Recortada.mat', 'bigtable_recortada')

x=bigtable_recortada;
randx = x(randperm(size(x,1)),:);

save('BigTable_Rand.mat', 'randx')

clear all
