function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 01-May-2022 20:02:39.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 3xQ matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 2xQ matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-3.82866;-5.29313;-5.14052];
x1_step1.gain = [0.258315165166717;0.192781118246155;0.19304218068169];
x1_step1.ymin = -1;

% Layer 1
b1 = [3.2184049471079649862;2.3317912118783650222;-1.654147894073256353;6.8055825528112370293;2.3579598111584432196;0.97786413686049933336;3.7328803361188307441;-0.48072577176227704321;0.7893812851101179584;-1.161794019791640542;-2.374168135157451065;-0.13615016504431748379;0.28796667957036931051;-0.85107913786281463864;0.82021728418333694766;0.75348738462946929229;0.75538540635158757386;1.4637737606690188752;-0.40553253495971824938;2.2342839541624766042;0.37281835218217157513;-0.062503216914736148269;1.464686994287113464;2.8044068853577255318;1.6126069031241057061;-4.2123050550157508098;8.631164033070303887;-4.2180570154915102421;1.1605948939058963187;-2.7209424724025561559];
IW1_1 = [-1.2598001307570605434 -1.1198947034411845802 1.4401306146837054012;-0.67468706641379805333 1.4374984400165062848 3.7748190435436361767;0.44386509950623531662 -2.7638523161849453125 -1.0302862035343491875;-3.6017612363289766009 5.5521883144807837596 5.2137265415423925674;-0.67195404160441385422 1.669162661828254679 3.9502192374994469226;-0.27605009416945208711 1.4193523359649846682 0.63882148582017550531;4.2622683467419806291 -1.3534845995401674212 0.15580365162120618505;-0.18439383325917171885 -4.7016852911143685034 -1.6616979806894043303;-0.46244720053337140531 1.025077037934128521 0.64290582167479115583;0.7659187252208898844 -0.83905446583835130436 -4.0219831829432708403;-0.67866546684163553405 7.2459293222742049423 -2.7016821546922589192;-8.3529207140309047475 -1.5908404255388421955 -0.58151626261348865476;-0.8397501165673598722 1.9570708307026509765 7.5134410883508655488;2.8267079237593075725 6.5068668696955525022 16.027132650204187314;-3.5332942380868681553 -16.034253409921198852 -6.5627212743134348827;5.7214529149794612906 0.86839968447999626999 2.3480940040284337123;6.064423429211787564 0.85094375931869736807 2.5100668708030235976;0.71049135293687615267 5.5322664578949858338 -4.3479551967520322364;1.5463307315669501119 0.78962593719490103972 6.7384376588458891888;0.447637675655339351 -7.203447034591170528 2.2667944030440994041;-1.4882372360510338627 -0.80680383320521287249 -6.7171213936652502952;-0.32108205993924326949 0.32783644312608223315 0.60227700207236878338;2.2468336587589181619 -0.020132895929407260832 -1.6105920565024232083;-0.9831388475306165331 -0.30960855983039631267 1.4254210706142440568;2.309016781309744637 -0.68305618272951140746 -1.9401005119627172668;-4.7962207275796222561 1.5121908647890331956 -0.1322097618096120808;7.1084517250753771478 -1.2269038607128790463 2.3640240127273122184;-2.7365247934250014339 0.69587132504447601899 3.3617363127365305076;1.0622462975488664583 2.4920516432349608671 0.67312097993723130074;-1.5946750931069049173 -1.6263697118228161997 -2.1050032469639714527];

% Layer 2
b2 = [-0.40712631242534325082;-0.78470750793217591834];
LW2_1 = [-0.20484551208002671485 -0.89281426741671920944 -0.034189634614837205451 0.014354897793349873786 0.63802159542309522244 -2.3549207435729089255 1.1107908308228509053 0.16767865063741785314 1.9771435818981746291 0.2356517360322838428 0.039420262690988590315 0.058393590125606992247 -0.083206140254319160832 -0.026553809794205875811 0.035731695949791572597 1.904648223463339729 -1.6783765334557558813 0.0042875158665296002336 0.44426258254527567493 0.029001005784927869069 0.46723167172406682157 0.49018363641121759366 0.47722720742283453177 -0.35566168743412257536 -0.25000891424914822858 0.83531061778931181561 0.0023046686508547751908 -0.062654058004083024169 0.19059941561476076433 -1.2348630843053292061;-2.5441704944694443213 -0.19291725392821312823 0.34510202526975797266 -0.10612723384394863457 0.31613758419687032486 2.730021410400453874 0.90274015546577146551 0.11186811969903069641 -3.3056559072800886234 -0.14869718099114173637 -0.44287102783000009687 -0.041083028670132734628 0.049899045396320035328 0.020100195598824623089 0.035397991801992642613 0.25043122699706127365 -0.21562421006128151824 -0.023296210807305279405 -1.2843265946277797607 -0.48772327125272912918 -1.273672005961411946 1.3374589217824892629 -0.25156749455625054823 4.5794017274067773116 0.29830659140855270151 0.7153806223434653333 0.086405595642646146337 -0.023477361038370881535 -0.43827529785362856485 0.8370282123201341351];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.0234961498084224;0.0158180999187882];
y1_step1.xoffset = [-46.5611006211289;-59.2985011470014];

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
