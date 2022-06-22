clc
clear all

load('BigTable.mat');

bigtable_mejorada = bigtable;
        
RotationRoll = (bigtable.roll/pi)*180;
RotationPitch = (bigtable.pitch/pi)*180;
RotationYaw = (bigtable.yaw/pi)*180;
        
dataRoll_improved=detrend(RotationRoll);
bigtable_mejorada.roll = dataRoll_improved;
        
dataPitch_improved=detrend(RotationPitch,0);
bigtable_mejorada.pitch = dataPitch_improved;
        
dataYaw_improved=detrend(RotationYaw);
bigtable_mejorada.yaw = dataYaw_improved;


        
save('BigTable_Mejorada.mat', 'bigtable_mejorada')
               

p=50;
y=-50;
for i = 0:120
    mytable_mejorada=table;
    for k = 1:552
        mytable_mejorada(k,:)=bigtable_mejorada(((i*552)+k),:);  
    end
    save((sprintf('P%d_Y%d_mejorado.mat',p,y)), 'mytable_mejorada')
    clear ('mytable_mejorada');
    
    if(y<50)
        y=y+10;
    else
        y=-50;
        p=p-10;
    end
end

  
clear all
