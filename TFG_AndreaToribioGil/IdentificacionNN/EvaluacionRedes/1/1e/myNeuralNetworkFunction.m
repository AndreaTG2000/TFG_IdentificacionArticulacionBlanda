function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 23-May-2022 13:18:17.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 3xQ matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-3.82866;-5.29313;-5.14052];
x1_step1.gain = [0.258315165166717;0.192781118246155;0.19304218068169];
x1_step1.ymin = -1;

% Layer 1
b1 = [-8.1631965037748042135;0.65640295760604838726;-3.441637279583488862;-5.3909817609896393265;1.2227841642799353039;-5.3873815493737451376;0.81713103445425827598;0.25221798114281324121;-0.19144478026647884783;-0.88758617769190828461;-0.18302988486981222604;-2.7664810653869169599;-1.4626925995744319842;0.11403227785593175736;-0.84641372714802132204;-0.62513568459546375866;-0.38391071015652156184;1.3303671634953364578;-0.18175559797713514154;-0.77287958392581457279;0.45760254440852277114;0.33431165005294127823;-2.4089120621541897371;2.6674587711752733021;1.8519224930178472821;4.0646352761695752065;1.6231689836746809874;-2.1789841173705877253;-0.9425945091644132301;4.9174463999284485638];
IW1_1 = [5.5910036288307942698 -3.9689657271001945738 -3.023513986123207431;1.703938207855093756 -1.1087771261045089588 -0.39023493727028146782;-0.25383323008342939531 -5.7740394422998075896 -1.7540125349043516056;-0.50188738302469437791 -0.83931003861462161186 4.7807451708750248187;-4.543695467008426192 -1.374312877097904062 -0.83537553159280864001;0.31467873284567193792 -0.46825882127139545341 5.7079333433092811489;-1.0010796793080851685 -0.023960380365718514373 0.98182790538555997362;-4.7669624426924839256 2.7254482173634415609 0.079667627783392855334;-2.8212389460198283864 3.5091099917463139946 -4.7982223165455462066;-1.8518116569731830623 -0.041178467607393617889 0.66098445663543103912;-3.2318294700640386452 -5.4892888764513791955 8.5312070591057533875;9.4992943381084469223 4.2277059853180309901 -3.7044511257176875318;-2.7099604696471617515 -0.015205289848294091526 1.1914071791638105591;-8.6664501581181099255 -4.1596896441441923997 -3.7076704338727575205;1.1950395735155920907 10.645066427863261183 3.3020632327777628134;2.4211938749962862438 5.5512760560912024488 11.856300535214638003;-1.4073346200805556538 -0.22779136823944712287 -0.052486729482021335369;-0.39901042785227947007 -8.9764302362518062495 -3.0596917348188004127;-5.7810428134694156199 -3.172720771736829537 -6.0962270444978239325;0.49482094526104930532 3.0460729538158983765 8.1639030657758642207;0.66625127254630434059 3.2370548503683114205 1.0887114952900862619;-0.2943676914515779286 0.16719536490186129307 1.2333315962365476448;-1.5424639736239584842 -0.38730698064919016899 5.1913626616995856011;8.7758616240323270574 -4.1067320598956573718 -0.94580411948897091801;3.2747252406358673404 -0.10636998848355753988 -1.5509913021861063687;0.46404204228848117131 0.40013616253966327596 4.9387367841920166711;4.1726856718660627621 -1.0354926674777134021 0.93280177293750332623;-1.0567521785965743319 -2.037449754266627 -2.5630783908906344948;-1.3865317947608630789 1.0265812044925402002 1.1015764939199403916;1.2464318950476862558 0.20736955404161580563 6.9588485243894853127];

% Layer 2
b2 = 0.62371368897945334009;
LW2_1 = [0.042607891547937322418 -0.93784614327824722402 0.044415793279102430691 0.48871343709236397812 0.2310655707863956132 -0.37624738783228228733 1.4436947852298562811 -0.063924310626104874355 -0.022901236286547180243 6.0635760439571795288 -0.013276551582362326048 -0.0094124046289449977282 -3.8881830902008287509 0.11599419031182617301 -0.068761055466683998483 -0.1156467392042246356 -4.8744480467892632447 -0.079839490776652630166 0.044634041332268031832 0.1647701745444453969 -0.28577108891141889124 -1.8753123426469293644 0.022355416104682279688 0.043231060051375884423 -1.5035944239042731141 0.24038332594422293087 0.16250862178051347917 0.72405818124591081464 -0.99663301741440057935 -0.12008826843557710018];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.0234961498084224;
y1_step1.xoffset = -46.5611006211289;

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
    X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},2); % samples/series
else
    Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
    Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end