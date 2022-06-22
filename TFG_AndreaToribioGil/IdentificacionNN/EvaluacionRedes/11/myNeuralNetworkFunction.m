function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 01-May-2022 21:30:02.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 1xQ matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = -43.8157806032881;
x1_step1.gain = 0.0222243012218279;
x1_step1.ymin = -1;

% Layer 1
b1 = [-42.377653464514523307;39.641428720312909206;36.889082250359606974;33.419247640520204357;-30.837590243966744197;26.665275792835977597;-25.217959993098137517;21.883274096112618423;19.397981154234607004;-17.3715845095180903;13.415444308444625321;-11.172505064622532345;6.3708538374697054607;-4.319430246373124227;1.2087610943816902154;-1.6305086351458051297;-4.3338599168038225429;7.2099302941107561438;-9.8470054774614954596;-12.35086494843293714;16.973213676652292747;19.718640148929338807;-22.831785457026782638;25.532463170698271426;-27.298451190487242002;30.848750602051200786;33.311131728546328645;-35.684121017748253735;-39.162436512170913261;42.018369534566559764];
IW1_1 = [41.604242499352714901;-41.605495237956311882;-41.289480049863556133;-41.422164461344756603;41.712147245697430264;-42.466189136328040377;41.604827812319911118;-41.888240477355523694;-41.61879249321877694;41.28645286867351416;-41.890231252973237019;41.562644194751442228;-42.099074254861037048;42.003431679632498685;-41.94473958239822764;-41.959461272316779912;-42.000571052428064434;42.004496043183216614;-41.993358167606345432;-42.142166648554137964;41.572851823828862905;41.391876731520625299;-41.232966011710452392;41.310450027043245314;-42.209158460887884701;41.649423826917875147;41.861252813206448309;-42.425318485945851421;-41.970228489135472216;41.982130772435240829];

% Layer 2
b2 = [-2.0358362297637357941;-0.030743384663451722716;0.011654908395835366502];
LW2_1 = [-1.0357012282881485898 0.83899086445235537823 -0.2998592012075950719 -0.37756468934180709152 -0.24856786491128918248 -0.3077629090519471422 0.11372406689066529017 0.37842281653117865181 -0.41015273661176498976 -0.17297960604266257589 0.10097738378394637004 0.060070755458804789284 -0.48592624622698582515 -0.38388459081419129548 0.12668697313746107858 -0.095482575449537532286 -0.74395764047554402421 -0.20604228209969926988 0.71568843958110017756 -0.0050304079143126947601 0.085777436990644564951 0.12709494368827506383 -0.10366280452557270764 -0.71713092806749967334 -0.39522404280536932442 0.052134325998667324642 0.10595284134746579818 -0.016561933449459782797 0.38523206432480799899 1.0765848686908117138;-0.045888638174848637996 0.025024925370633901989 0.04937842316196824205 0.041235578896629813961 -0.057030346265720288645 0.033575569267513996619 -0.0074062836690025187977 0.056382080499293697751 0.023598265115762392941 -0.029716102279030254946 0.059882007765390515841 -0.017107013796240473635 0.60573594161504085154 0.53614532696433603309 0.022262126668969456356 -0.042610021900157779573 0.6121926313756295146 0.45648428768998117189 -0.013946052653882778233 0.012879067359746783697 -0.082275221725796640615 -0.029054268546848463495 0.072997526985218996742 0.017756250130405746429 0.039204552741239698244 -0.066768298818658658456 -0.011701196543902754946 0.010856246648430730936 0.07087154011817102528 -0.029491103332346599308;0.041259074254045284558 -0.069222011044712830619 -0.017053828937620415379 -0.01962941952405663007 0.10113033622129646849 0.045782671482591810741 0.058953095683239309377 -0.068946752160381444274 0.015235020352013010914 0.042099539547889044955 -0.038571353353515129558 0.049171050050802182774 -1.0719383702407538905 -1.0077387765593119884 -0.022212571017655658584 -0.17507301812857700707 0.26202894038278579103 0.12625014293055192294 -0.063690558432968960578 -0.026745355920239886199 0.065455417437562016247 0.03420321803904852187 -0.040541523202272333748 0.02543174243026266948 -0.021854250509126850466 0.053509853842633715859 0.025054925877776933196 -0.027294928397703720202 -0.061869680517039081502 0.033136496721797192855];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [3.94998528630481;0.317100433634843;0.313456040924821];
y1_step1.xoffset = [-0.204557;-3.18865;-3.14955];

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
