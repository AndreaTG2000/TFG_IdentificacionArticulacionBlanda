function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 01-May-2022 20:34:21.
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
x1_step1.xoffset = [-3.72296;-3.18865;-3.14955];
x1_step1.gain = [0.271388832349549;0.317100433634843;0.313456040924821];
x1_step1.ymin = -1;

% Layer 1
b1 = [-2.3795358103819217455;-3.4185692026873875093;-5.3216725016009096549;5.1407032990847190135;-2.5444077238998983326;3.554021716357333105;-2.4655951638619768573;-1.3143022655934981646;1.0145819854462385656;1.2342072150105931616;-3.2980370391394822072;-1.7105168744636682909;0.39043477518766517287;-1.7550179160065428885;0.77068383647746196985;0.24794754006673605518;0.49696331641487961894;5.3701825298796705965;1.76936092824177571;1.2350021572087028776;2.5840525370034090891;1.5296198258345548027;3.6751945175757909645;2.0498627886747895488;4.7077468961813879744;1.9678198790502234861;2.6595128574693158718;4.0300281394551920044;8.6233260773049540404;-4.438066909278703065];
IW1_1 = [-0.64779785163630199119 -4.7285913460691038068 -2.068732371054321284;2.7820158029793873311 1.3921058810416562235 -2.2575060040827445995;5.2763585939841988193 -3.0569983285841084708 -0.88681937705400482042;0.25388442445162140437 0.20015340981964135914 -6.2382441696929200603;-0.001380499688305182257 -4.262489218509575295 -1.4198747049225617367;0.7581550296666933475 7.7794948500943981173 -0.47614947777141830576;0.566126382233635983 0.075614895390920949803 4.9596294460948922023;5.1058347538046797709 -0.37267873233555354195 2.3756217800713614885;0.94817807623085947899 0.70863284013521732341 -2.7257154050184442262;-5.2015970679121590337 -0.11904161044388425483 -2.614691722228486892;8.071074717800350129 -0.11039449047397494053 -3.9374921654204197985;0.68610620676671463247 0.29118413803923953731 3.5155662005123766711;2.3694267132965118883 -5.1311977515006246264 2.7596593454299047643;5.1927885822289550077 -2.2923450398245779347 6.0334593786842622976;0.74576139794411910877 -5.8363843766414476022 2.3903251689013296222;-0.57331475141018684027 1.4681899009618897267 1.8734566211093917065;1.5918394637976300832 -5.2377545816323545225 2.5797853263109544741;7.0693357767723581375 -10.519248677615172127 -7.7598380004715323821;4.1144273785976617219 -2.3729629750248415476 -7.7479706399004752981;0.14328264559932074595 -7.1701260773903481294 2.1583905394013749302;4.0529398988798543968 -1.3623924166585288376 0.37393857872048053004;3.115228173979470494 4.7971576533693180977 -3.3499718963592508558;1.8245950233329901735 -1.9099263762019633717 -15.125973612084012032;3.3053424662785184651 -0.87533408679555824161 -0.11185263992584745796;13.75929944157986462 -1.7200258116254829588 5.6406980897943865827;2.3180344155639316384 -2.2903196731283901322 2.2549270134782806174;0.1333656754386489951 4.6660420492287677519 -1.550556083112147876;-0.68855183791180740727 3.2360351537136140543 3.7206799085250068515;6.0346841982266603566 -2.9728790077823976645 -3.2624145742038717088;-2.6769162692165933137 -2.4453966936524631492 -2.3731781432777636631];

% Layer 2
b2 = 0.35510052183981244411;
LW2_1 = [-0.68156108086897249088 -0.083026828965432397656 -0.10128048894184737971 0.18523124537136312351 1.055548479482757207 0.30793013753416081935 -0.75890637126593962769 0.70257677732873169418 0.67979209896157910542 0.7975927827436127826 -0.016194126484504928892 1.1303293773009694956 -1.6524323307419550577 0.079876400580249320993 -2.9249360560354409344 0.23746890784635404925 3.9529379340772923257 -0.071540225920518410452 -0.044388523217080443073 0.91482139981949961438 0.87089342146710801984 -0.12479679482381829392 0.044176482486002845163 -1.3508480338550965527 0.0343646041953283507 0.1701650585575732455 -0.76613688425891890432 0.051787235612194518208 -0.054870993165107607992 -0.1801413088692788711];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.0222243012218279;
y1_step1.xoffset = -43.8157806032881;

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
