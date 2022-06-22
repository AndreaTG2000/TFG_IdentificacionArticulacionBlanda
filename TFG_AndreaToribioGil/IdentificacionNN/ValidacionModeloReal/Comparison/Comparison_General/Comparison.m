clc
clear all
load('BigTable');
load('ResultsTF');

results=table2array(results);
arr = table2array(bigtable_recortada);


for j=1:441
    alpha(j,1) = arr(j,1);
    beta(j,1) = arr(j,2);
    m1(j,1) = arr(j,3);
    m2(j,1) = arr(j,4);
    m3(j,1) = arr(j,5);
    roll(j,1) = arr(j,6);
    pitch(j,1) = arr(j,7);
    yaw(j,1) = arr(j,8);
end

for i=1:12
    load(sprintf('resultNet%d.mat',i));
    resNet = table2array(resultsNet);
    for j=1:441
        m1Net(j,1) = resNet(j,3);
        m2Net(j,1) = resNet(j,4);
        m3Net(j,1) = resNet(j,5);

        if (i == 7||i == 8||i==9||i==10)            
            pitchNet(j,1) = resNet(j,6);   
            yawNet(j,1) = resNet(j,7);

        elseif (i == 1||i == 2||i==3||i==12)
            pitchNet(j,1) = resNet(j,6); 

        elseif (i == 4||i == 5||i==6||i==11)
            yawNet(j,1) = resNet(j,6);

        end
        
        if (i==1||i==7)
            pitchTF(j,1)=results(j,3);
        elseif(i==4||i==7)
            yawTF(j,1)=results(j,4);
        end

    end

    if (i == 8||i==9||i==10)            
        Arr = [alpha beta m1 m2 m3 m1Net m2Net m3Net pitch yaw pitchNet yawNet];
        comparison = table;              
        comparison = array2table(Arr,'VariableNames',{'alpha','beta','m1','m2','m3','m1Net','m2Net','m3Net','pitch','yaw','pitchNet','yawNet'});
    elseif(i==7)
        Arr = [alpha beta m1 m2 m3 m1Net m2Net m3Net pitch yaw pitchNet yawNet pitchTF yawTF];
        comparison = table;              
        comparison = array2table(Arr,'VariableNames',{'alpha','beta','m1','m2','m3','m1Net','m2Net','m3Net','pitch','yaw','pitchNet','yawNet','pitchTF','yawTF'});
    elseif (i == 2||i==3||i==12)
        Arr = [alpha beta m1 m2 m3 m1Net m2Net m3Net pitch yaw pitchNet];
        comparison = table;              
        comparison = array2table(Arr,'VariableNames',{'alpha','beta','m1','m2','m3','m1Net','m2Net','m3Net','pitch','yaw','pitchNet'});
    elseif(i==1)
        Arr = [alpha beta m1 m2 m3 m1Net m2Net m3Net pitch yaw pitchNet pitchTF];
        comparison = table;              
        comparison = array2table(Arr,'VariableNames',{'alpha','beta','m1','m2','m3','m1Net','m2Net','m3Net','pitch','yaw','pitchNet','pitchTF'});        
    elseif (i == 5||i==6||i==11)
        Arr = [alpha beta m1 m2 m3 m1Net m2Net m3Net pitch yaw yawNet];
        comparison = table;              
        comparison = array2table(Arr,'VariableNames',{'alpha','beta','m1','m2','m3','m1Net','m2Net','m3Net','pitch','yaw','yawNet'});
    elseif(i==4)
        Arr = [alpha beta m1 m2 m3 m1Net m2Net m3Net pitch yaw yawNet yawTF];
        comparison = table;              
        comparison = array2table(Arr,'VariableNames',{'alpha','beta','m1','m2','m3','m1Net','m2Net','m3Net','pitch','yaw','yawNet','yawTF'});        
    end   

    save((sprintf('Comparison%d.mat',i)), 'comparison')
%     x=comparison;
%     comparison_rand = x(randperm(size(x,1)),:);
%     save((sprintf('Comparison_rand%d.mat',i)), 'comparison_rand')

    
end
clear all