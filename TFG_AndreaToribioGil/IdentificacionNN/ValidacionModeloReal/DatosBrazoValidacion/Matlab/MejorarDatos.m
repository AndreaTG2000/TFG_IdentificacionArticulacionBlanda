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
        
        pitch=pitch-pitch(1);
        yaw=yaw-yaw(1);
        roll=roll-roll(1);
       
        mytable_mejorada.roll = roll;
        mytable_mejorada.pitch = pitch;
        mytable_mejorada.yaw = yaw;
        
        myfile = sprintf('P%d_Y%d_mejorada.mat',i,k);
        save(myfile, 'mytable_mejorada')
    end
end

clear all
