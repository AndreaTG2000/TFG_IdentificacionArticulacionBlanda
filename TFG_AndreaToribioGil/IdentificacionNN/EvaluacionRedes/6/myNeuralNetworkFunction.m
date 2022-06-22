function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 01-May-2022 21:21:29.
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
x1_step1.xoffset = [-0.204557;-3.18865;-3.14955];
x1_step1.gain = [3.94998528630481;0.317100433634843;0.313456040924821];
x1_step1.ymin = -1;

% Layer 1
b1 = [-4.9724147008354799837;4.0721324280477118052;4.4505003851199367304;-4.1596126174546119714;3.2455304537526874498;-3.7427550554033426344;-1.9593687756702000691;2.1510113732118720797;-2.5909833338704260086;1.2104492058942446508;1.7346885628290766856;-0.96332191775069664352;1.6946310530047921095;0.13777748543814211102;0.83655470344127058624;0.71725462869064215976;0.47898871158232103618;-1.6877770713703061922;-0.47515715397717661617;-1.2440588165144064181;0.62496860912779217401;0.56765165246387627729;2.1886896549357297559;3.9395350771927590827;2.5285971632801942377;2.8868860848044555212;-4.1360451118288130701;-4.1958476490546186;-2.8920461055227719704;5.3457685273887642907];
IW1_1 = [1.5964819664354168438 2.9455769008602032955 -0.30656791404942645984;-2.6516205353018249546 1.3704794029344307127 -2.7360162944918737793;-2.5003583634552133397 -1.302616208066876613 -2.7252798687701060842;2.3746296242257933784 -2.5182151570194966084 1.8229802072112546441;-1.385874326971421544 -2.1829038517655572349 -3.4012675541372372479;0.91972350940486546911 -2.3838261177378519129 -3.2715235576688876939;1.1147023063099319451 -2.6384034820393300613 -0.58545241105811907101;-3.3523123651509534326 -2.6866296992903389018 2.9440019782436799289;3.8236856378723507177 -1.7913767890769241031 0.050964840479827237807;-2.0609712417236929483 3.8412839209017684006 0.10470046308475994268;-0.51365499798370295448 -3.7036776284275938487 2.8580524013393135974;2.727382009486893466 0.86892378179472318234 0.62582051784234715708;-3.5196036717080843026 -4.1606921627460069502 0.73375467744691413863;3.9600634939424086411 -0.42476613845728361518 -3.128407951861880143;0.29109609491270577175 1.415429880509241567 3.7669101119984698123;0.16750626839284868397 -2.8195544130130016924 1.3918465549923078051;0.023446706286223813198 -4.2287890988267138326 2.3664122158021103637;-2.6187045285645500492 2.0946843010916476047 -0.93403726444194656864;-3.4925787543324080531 -1.8242019086008816053 1.8396672300752403562;-0.39716816237601004769 2.3158942983226582513 -2.4277383454303151922;2.9208503619593240153 -0.10133672735264806497 -0.34507315575045505174;3.1807019497084896287 2.7627117365684283889 -2.2561965825878225189;0.82996355649401754029 2.8952098734701121607 2.9006625518101070149;1.1896175045369679069 -0.70941215102808741211 -3.6749133783744745152;0.25332128871300152451 1.8589648567373853183 -2.1132491584844861343;2.7862759997204729068 -1.2898618857975843177 -2.1756532536570332148;-3.6591055901600961775 -2.3791360569825537041 -1.3587587903448894444;-0.26095382143308115674 1.090501729341615933 -3.4302797084445835196;-0.72912735634777170457 -1.2419105997931356722 -2.9035061124589938153;-0.1367447557149444326 2.709309658384948083 -1.5017972323142201319];

% Layer 2
b2 = 0.40242112268074714532;
LW2_1 = [-0.07583750438151734552 -0.056196991144904950843 -0.14239783401321978729 -0.07288083074259019134 0.2818160105875623378 -0.26335203073924839945 0.21867499844338059156 -0.11193553652141124966 -0.01327304106608287286 -0.054794777655293711027 -0.17032263231038852203 -0.037492730016894362799 0.11633071255403501509 0.011752096033584428711 0.43992154069388239579 1.4341410984180766874 -0.43729326194527984306 -0.021530075640319844971 0.011133293559641307957 0.70457897754090847986 -0.026375439099844310425 -0.0123935433624357879 -0.96345881315473524964 -0.085859119303472952733 -0.12914828321672189304 -0.0064982001707256957165 -0.016824350270639398114 -0.069366090755985446159 -0.52668829914920634039 -0.35300671785211323872];

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