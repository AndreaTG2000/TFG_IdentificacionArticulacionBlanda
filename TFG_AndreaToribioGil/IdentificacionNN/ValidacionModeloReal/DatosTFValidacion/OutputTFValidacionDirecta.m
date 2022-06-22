clc

load('BigTable');
load('tf_mean_alpha.mat');
load('tf_mean_beta.mat');
arr = table2array(bigtable_recortada);
results=table;
j=0;

for alpha=-50:5:50
	for beta=-50:5:50
    	j=j+1;
        opt = stepDataOptions('StepAmplitude',alpha);
        [p,t]=step(tf_mean_alpha,opt,3.5);
        opt = stepDataOptions('StepAmplitude',beta);
        [y,t]=step(tf_mean_beta,opt,3.5);
        new=[alpha beta p(101) y(101)];
        res = array2table(new,'VariableNames',{'alpha (in)'... 
                        'beta (in)','PitchTF (out)','YawTF (out)'});

        results = [results;res]; 
    end
end
save('ResultsTF','results')

% clear all


