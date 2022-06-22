clc
clear all

%Base de datos completa
load('BD_complete.mat')

RotationPitch = randx.pitch;
RotationYaw = randx.yaw;

m1Position = randx.m1Position;
m2Position = randx.m2Position;
m3Position = randx.m3Position;

%Directa

IN_D = [m1Position.'; m2Position.'; m3Position.'];

OUT_D_P = [RotationPitch.'];
OUT_D_Y = [RotationYaw.'];
OUT_D_PY = [RotationPitch.'; RotationYaw.'];

%Inversa

IN_I = [RotationPitch.'; RotationYaw.'];

OUT_I = [m1Position.'; m2Position.'; m3Position.'];


save('IN_D.mat','IN_D')
save('OUT_D_P.mat','OUT_D_P')
save('OUT_D_Y.mat','OUT_D_Y')
save('OUT_D_PY.mat','OUT_D_PY')

save('IN_I.mat','IN_I')
save('OUT_I.mat','OUT_I')

clear all
