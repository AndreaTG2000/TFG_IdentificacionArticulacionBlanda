clc

for i = 1:12
    load('BigTable');
    arr = table2array(bigtable_recortada);
    j=0;
    if (i == 9||i == 10||i == 11||i == 12)
        resultsNet = table;
        load(sprintf('ResultsStruct%d.mat',i));
        Net=results.net;
        for alpha=-50:5:50
            for beta=-50:5:50
                j=j+1;
                Pitch = arr(j,7);
                Yaw = arr(j,8);
                if (i == 9||i==10)
                    input = [Pitch;Yaw];
                    output=Net(input);
                    resA=[alpha beta transpose(output) transpose(input)];
                    resT = array2table(resA,'VariableNames',{'alpha (out)'...
                        'beta (out)','posan1 (out)','posan2 (out)'...
                        'posan3 (out)','Pitch (in)','Yaw (in)'});
                
                elseif (i == 11)
                    input = Yaw;
                    output=Net(input);
                    resA=[alpha beta transpose(output) transpose(input)];
                    resT = array2table(resA,'VariableNames',{'alpha (out)'...
                        'beta (out)','posan1 (out)','posan2 (out)'...
                        'posan3 (out)','Yaw (in)'});
        
                elseif (i == 12)
                    input = Pitch;
                    output=Net(input);
                    resA=[alpha beta transpose(output) transpose(input)];
                    resT = array2table(resA,'VariableNames',{'alpha (out)'...
                        'beta (out)','posan1 (out)','posan2 (out)'...
                        'posan3 (out)','Pitch (in)'});
                
                end                         
                
                resultsNet = [resultsNet;resT]; 

            end
        end
        save((sprintf('resultNet%d.mat',i)),'resultsNet')
    end
    clear all
end 
