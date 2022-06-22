clc
clear all

%Base de datos P0
load('BD_P0.mat')

RotationYaw = bigtable_p0.yaw;

m1Position = bigtable_p0.m1Position;
m2Position = bigtable_p0.m2Position;
m3Position = bigtable_p0.m3Position;


IN_D = [m1Position.'; m2Position.'; m3Position.'];

OUT_D_Y= [RotationYaw.'];

IN_I_Y = [RotationYaw.'];

OUT_I = [m1Position.'; m2Position.'; m3Position.'];


save('IN_D.mat','IN_D')

save('OUT_D_Y.mat','OUT_D_Y')


save('IN_I_Y.mat','IN_I_Y')

save('OUT_I.mat','OUT_I')

clear all