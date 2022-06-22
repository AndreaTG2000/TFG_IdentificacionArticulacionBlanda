clc
clear all

for i=97:114
    load('BigTable');
    arr = table2array(bigtable_recortada);
    j=0;
    k=char(i);
    resultsNet = table;
    load(sprintf('ResultsStruct1%c.mat',k));
    Net=results.net;
    for alpha=-50:5:50
        for beta=-50:5:50
            j=j+1;
            posan1 = arr(j,3);
            posan2 = arr(j,4);
            posan3 = arr(j,5);
            input = [posan1;posan2;posan3];
            output=Net(input);
            resA=[alpha beta transpose(input) transpose(output)];
            
            resT = array2table(resA,'VariableNames',{'alpha (in)', 'beta (in)','posan1 (in)','posan2 (in)','posan3 (in)','Pitch (out)'});
                                
            resultsNet = [resultsNet;resT]; 
        end
	end
    save((sprintf('resultNet1%c.mat',k)),'resultsNet')

    clear all
end

