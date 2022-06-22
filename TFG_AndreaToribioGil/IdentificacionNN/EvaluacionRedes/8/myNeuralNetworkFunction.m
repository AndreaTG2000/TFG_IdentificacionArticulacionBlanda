function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 01-May-2022 20:46:52.
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
x1_step1.xoffset = [-3.72296;-3.18865;-3.14955];
x1_step1.gain = [0.271388832349549;0.317100433634843;0.313456040924821];
x1_step1.ymin = -1;

% Layer 1
b1 = [2.2847525576104383838;-2.2099645765939652797;-3.4788188994779409846;-8.7653530474333880562;-3.3699392644393380003;-7.2490625263715173787;2.936235969302272597;2.8165724460403578355;3.9697423352785001782;3.6029325028266745434;-3.9765102832248051534;3.5965788411936183699;-2.8574036402090867703;-0.49237508573691618485;0.34967116188486346839;-0.016132004101645631283;0.42598151511817239356;-2.464066719233365621;2.5722369089282905996;2.3828510747134452608;3.8040880493217024139;3.6684503368844287863;-6.4748109594440501624;2.4653108691598446534;-0.9871080049347068508;-3.6197365379171251298;-4.8624969035023983821;-2.9816847852070278435;-4.12472521718917573;2.9765055224630443398];
IW1_1 = [-0.95330809465836863215 1.3861031036509523506 0.31437228673055700456;1.4210107361243724533 -1.3992358216419464867 -1.5789302428877298734;1.2267797159310536159 -1.8076024228578306818 1.5918009705816045241;3.4986421571342782855 -6.1277868523734513317 -2.3817814191652431077;2.1722059595409888288 -1.6426615312673487068 -3.3356551164642018747;9.987346614744522455 -13.136422846284206756 5.0014880221611974775;-0.78691205434762512283 2.2360359049235345452 -2.3288899608700699417;3.4447058671312777989 -4.6263235253582664086 3.1843861690565855582;-1.2749401597292793209 -2.9059127503616877242 6.7249821579534962979;-1.2490811232884189153 -3.566406502399290801 6.9884131074291850894;13.013969863404975413 -7.7299604680878042373 -2.2657373135470284531;2.1982130038136236116 -6.5181337100841503229 -0.090533651050539384886;-0.53622965883401496612 0.43113637237669050206 4.2226798605779292117;-4.7383688312537746157 2.5913974314041179348 -4.6180201522577775108;-2.8003438092789942893 4.7889909725576691457 4.315985432487856599;-0.88941908717035067511 0.39457576142318245838 -0.30406497828545658857;0.6329341800509691307 -0.58826442566538261758 0.52131245829736116981;-4.3317853951353217923 0.48943223607089925142 6.4339290494568368572;4.2968411179810894751 -0.37774483759437249564 -6.7269035487867485656;8.5208481602782377706 -3.5304895152433188876 -2.1326726314575128463;3.657166499585615238 -6.6639867499660931927 2.7585724909072419919;-4.2236277966385875615 2.5924700148055750404 -6.9510145002943639625;-10.153435681262443779 16.781265663934725296 2.2187253374536894945;4.5371260825654227133 -1.0731784709112890397 -6.5522766548172635126;-2.2194368895455567348 -0.12335940040662031481 -0.057917077757828276663;-1.8821199688901664171 2.9409764573753953698 -5.79405507821887511;-5.2688134683899443544 -3.3160821533845763476 0.10138039159400007161;-1.5871807970605182891 1.899355396561202669 -1.5777950159687303966;-2.8554357973303918783 -2.2963441169662091035 -2.1664401188647484098;1.6481794956486499615 -2.3591263814097223062 1.205246797493077171];

% Layer 2
b2 = [-1.0000449784475744508;0.0033884158338470453213];
LW2_1 = [3.8812864776660078725 3.4432690494646904789 0.83970319480717103833 0.67734917362174196231 -1.1502566314832332051 -0.055665335775024152309 -0.16740621429730753733 -0.36516524783832010614 0.19847076150841211351 0.028305677375229699316 0.050597403656767264701 -0.12876087323761448156 -0.13434172566421068162 0.096116333151630761744 -0.1618719229332319931 3.2753545519223798976 3.2396147636267969006 -1.3608917945279963568 -0.67741099055705922272 0.12804379330413878657 0.26335282700298057179 -0.22141285203777832935 0.0053754231456025281313 -0.66008295171515563027 -1.032333350991849974 0.35046493815559875973 -0.51956544404967430761 -0.10683142481630940324 0.50512286733678701811 -0.56446551148149681776;-0.81108868756027929781 -0.17026156700690694978 0.27405278046017739202 -0.17633108353858573114 -0.040604680848931658244 0.024564992416341028397 -0.21458481722285793758 -0.60901337634826457901 -0.19348004486347650244 0.16661494688679193144 -0.000451640463807679931 -0.072367848374158078029 -0.12302632336617622122 0.020488968772521515271 0.0027249566817526093936 1.6997681380409730423 2.8740206838378110632 1.4461276129076394703 1.0531919948085333161 -0.020299420194385884436 0.37302506146204478243 0.0061670585029430669693 0.052841107421539280919 0.42297948482430119954 -0.18353712418096937431 -0.14985365893393018388 0.26073374840574703448 -0.78130592730890069397 -0.19973785331941457111 -0.96385844525883046519];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.0235714035168697;0.0222243012218279];
y1_step1.xoffset = [-46.2893467388983;-43.8157806032881];

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