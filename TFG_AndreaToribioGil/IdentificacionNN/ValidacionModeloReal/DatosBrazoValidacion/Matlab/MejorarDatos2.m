clc
clear all

for i = -50:5:50
    for k = -50:5:50
        myfilename = sprintf('P%d_Y%d.mat',i,k);
        load(myfilename);
        mytable_mejorada = mytable;
        
        roll = (mytable.roll/pi)*180;
        pitch = (mytable.pitch/pi)*180;
        yaw = (mytable.yaw/pi)*180;
        
        pitch_improved=detrend(pitch,0);
        yaw_improved=detrend(yaw);
        roll_improved=detrend(roll);
       
        mytable_mejorada.roll = roll_improved;
        mytable_mejorada.pitch = pitch_improved;
        mytable_mejorada.yaw = yaw_improved;
        
        myfile = sprintf('P%d_Y%d_mejorada.mat',i,k);
        save(myfile, 'mytable_mejorada')
    end
end

clear all
