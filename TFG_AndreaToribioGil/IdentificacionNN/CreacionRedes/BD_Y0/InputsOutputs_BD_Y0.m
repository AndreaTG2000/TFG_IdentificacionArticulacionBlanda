clc
clear all

%Base de datos Y0
load('BD_Y0.mat')

RotationPitch = bigtable_y0.pitch;

m1Position = bigtable_y0.m1Position;
m2Position = bigtable_y0.m2Position;
m3Position = bigtable_y0.m3Position;


IN_D = [m1Position.'; m2Position.'; m3Position.'];

OUT_D_P= [RotationPitch.'];

IN_I_P = [RotationPitch.'];

OUT_I = [m1Position.'; m2Position.'; m3Position.'];


save('IN_D.mat','IN_D')

save('OUT_D_P.mat','OUT_D_P')


save('IN_I_P.mat','IN_I_P')

save('OUT_I.mat','OUT_I')

clear all