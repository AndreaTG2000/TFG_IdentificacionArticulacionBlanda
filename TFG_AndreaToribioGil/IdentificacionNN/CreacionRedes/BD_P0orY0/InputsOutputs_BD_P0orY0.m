clc
clear all

%Base de datos P0 or Y0
load('BD_P0orY0.mat')

RotationPitch = bigtable_p0ory0.pitch;
RotationYaw = bigtable_p0ory0.yaw;

m1Position = bigtable_p0ory0.m1Position;
m2Position = bigtable_p0ory0.m2Position;
m3Position = bigtable_p0ory0.m3Position;


IN_D = [m1Position.'; m2Position.'; m3Position.'];

OUT_D_P = [RotationPitch.'];
OUT_D_Y = [RotationYaw.'];
OUT_D_PY= [RotationPitch.';RotationYaw.'];

IN_I_PY = [RotationPitch.';RotationYaw.'];

OUT_I = [m1Position.'; m2Position.'; m3Position.'];


save('IN_D.mat','IN_D')
save('OUT_D_P.mat','OUT_D_P')
save('OUT_D_Y.mat','OUT_D_Y')
save('OUT_D_PY.mat','OUT_D_PY')

save('IN_I_PY.mat','IN_I_PY')

save('OUT_I.mat','OUT_I')

clear all