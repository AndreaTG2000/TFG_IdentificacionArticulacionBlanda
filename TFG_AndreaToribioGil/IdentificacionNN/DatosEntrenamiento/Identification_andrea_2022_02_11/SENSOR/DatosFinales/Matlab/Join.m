bigtable = table;

for i = 50:-10:-50
    for k = -50:10:50
        load (sprintf('P%d_Y%d.mat',i,k));
        bigtable = [bigtable;mytable];        
    end
end

for j=1:66792   
    bigtable.Tiempo(j)=0+(0.02*(j-1));
end

save('BigTable.mat','bigtable')
clear all
