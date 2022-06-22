clc
clear all
j=0;

for i = -50:5:50
    for k = -50:5:50
        j=j+1;
        myfilename = sprintf('P%d_Y%d_mejorada.mat',i,k);
        load(myfilename);
        old = table2array(mytable_mejorada);
        
        bigtable_recortada = table;
        
        new(j,1)= old(176,2);    
        new(j,2)= old(176,3); 
        new(j,3)= old(176,7); 
        new(j,4)= old(176,8); 
        new(j,5)= old(176,9); 
        new(j,6)= old(176,4); 
        new(j,7)= old(176,5); 
        new(j,8)= old(176,6); 
               
        bigtable_recortada = array2table(new,'VariableNames',{'cs0','cs1','m1Position','m2Position','m3Position','roll','pitch','yaw'});

        save('BigTable', 'bigtable_recortada')
    end
end

t = 0:j-1;

t=t.';

figure
plot(t,bigtable_recortada.roll)
xlabel('casos')
ylabel('Rotación Roll (grados)')
grid on
title('Rotación Roll vs. casos','Datos Finales Validación. Cada caso es una pareja de alpha y beta')
figure
plot(t,bigtable_recortada.pitch)
xlabel('casos')
ylabel('Rotación Pitch (grados)')
grid on
title('Rotación Pitch vs. casos','Datos Finales Validación. Cada caso es una pareja de alpha y beta')


figure
plot(t,bigtable_recortada.yaw)
xlabel('casos')
ylabel('Rotación Yaw (grados)')
grid on
title('Rotación Yaw vs. casos','Datos Finales Validación. Cada caso es una pareja de alpha y beta')

figure
plot(t,bigtable_recortada.m1Position)
xlabel('casos')
ylabel('Posición m1 (radianes)')
grid on
title('Posición m1 vs. casos','Datos Finales Validación. Cada caso es una pareja de alpha y beta')

figure
plot(t,bigtable_recortada.m2Position)
xlabel('casos')
ylabel('Posición m2 (radianes)')
grid on
title('Posición m2 vs. casos','Datos Finales Validación. Cada caso es una pareja de alpha y beta')

figure
plot(t,bigtable_recortada.m3Position)
xlabel('casos')
ylabel('Posición m3 (radianes)')
grid on
title('Posición m3 vs. casos','Datos Finales Validación. Cada caso es una pareja de alpha y beta')
clear all