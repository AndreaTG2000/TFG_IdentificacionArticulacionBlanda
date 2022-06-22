clc

for i = 1:12
    load('BigTable');
    arr = table2array(bigtable_recortada);
    j=0;
    if (i == 1||i == 2||i == 3||i == 4||i == 5||i == 6||i == 7||i == 8)
        resultsNet = table;
        load(sprintf('ResultsStruct%d.mat',i));
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
                if (i == 7||i == 8)
                
                    resT = array2table(resA,'VariableNames',{'alpha (in)'... 
                        'beta (in)','posan1 (in)','posan2 (in)'...
                        'posan3 (in)','Pitch (out)','Yaw (out)'});
                                
                elseif (i == 1||i == 2||i==3)
                
                    resT = array2table(resA,'VariableNames',{'alpha (in)'...
                        'beta (in)','posan1 (in)','posan2 (in)'...
                        'posan3 (in)','Pitch (out)'});
                
                elseif (i == 4||i == 5||i==6)
                
                    resT = array2table(resA,'VariableNames',{'alpha (in)'...
                        'beta (in)','posan1 (in)','posan2 (in)'...
                        'posan3 (in)','Yaw (out)'});
                end                         
                
        resultsNet = [resultsNet;resT]; 
            end
        end
        save((sprintf('resultNet%d.mat',i)),'resultsNet')
    end
    clear all
end

