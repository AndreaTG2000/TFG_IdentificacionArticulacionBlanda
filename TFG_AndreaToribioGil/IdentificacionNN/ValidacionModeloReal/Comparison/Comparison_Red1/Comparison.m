clc
clear all
load('BigTable');
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

i='a';
load(sprintf('resultNet1%c.mat',i));
resNet = table2array(resultsNet);
for j=1:441
    m1Net(j,1) = resNet(j,3);
    m2Net(j,1) = resNet(j,4);
    m3Net(j,1) = resNet(j,5);

    pitchNet(j,1) = resNet(j,6); 
             
end
                

arr = [alpha beta m1 m2 m3 m1Net m2Net m3Net pitch yaw pitchNet];
comparison = table;              
comparison = array2table(arr,'VariableNames',{'alpha','beta','m1','m2','m3','m1Net','m2Net','m3Net','pitch','yaw','pitchNet'});
                

save((sprintf('Comparison1%c.mat',i)), 'comparison')
x=comparison;
comparison_rand = x(randperm(size(x,1)),:);
save((sprintf('Comparison_rand1%c.mat',i)), 'comparison_rand')

clear all
