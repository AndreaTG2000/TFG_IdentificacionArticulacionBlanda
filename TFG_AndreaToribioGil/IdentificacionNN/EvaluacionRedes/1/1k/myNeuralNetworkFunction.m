function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 06-Jun-2022 22:57:58.
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
b1 = [-0.18182201945731138459;-0.99502303205853293022;0.46277454870023371214;-0.76473291747783178618;0.44653830845655112514;0.78786238680143694246;-2.7779260735216442235;0.13521090341155778125;0.55722829432871889832;-1.2351978864199593122;1.0286704346382884445;-0.44739373281995681308;-1.4813733716249062322;0.50207672641431178029;-1.2246864613444770065;0.51879054604010632623;0.5666464588241668654;-0.5130181572748455654;0.10410226702041164293;0.77022162714537523165;-4.8470859536479524721;0.96514219332662731787;0.6530787013576145883;-2.0484027728596809759;0.21960424266121048031;0.4670989827274188988;-0.083280773181023823315;0.34150218043846425342;-0.48282682671479915104;-5.0584737698438999587];
IW1_1 = [-0.085691314413741781486 1.5448304619072530386 1.8431298024860218732;4.690274137387945963 -1.1489344538757457759 0.23465727009572667772;-4.6756199391060402348 2.1181710153153203713 0.29557796980779255103;-0.87801088614221001194 -1.2509260762309664106 0.55802070645000134697;-3.8610219639893017529 2.1444900576335870213 0.35659248036060547937;2.2144130898480245406 -0.95228713040177914717 -1.0123202651450495804;-12.573998467354032371 0.20140349656864992012 -0.048600252375752404921;1.2787494212823946604 -1.2381928521527736375 2.5660756823632526746;-1.282651527979342676 -0.75934037109355889683 1.4156031183324593314;0.50323578421942483097 9.0731397658573591514 2.5921109467411480587;-0.6176957149219158838 -8.622581916183490236 -2.3778620665348930707;3.3559536969811696316 -2.7276893550768406271 -0.59658311473205516418;-0.15658293834773198694 -1.2394669583289990022 -1.3742634444961332463;-1.2463595209809588127 3.0067577014497479659 -0.13567509705607699866;-2.1480103792620584002 0.17751099416058691016 0.24289786014327813257;5.9875351455793479616 0.059343479846586916215 -1.3780563225712874065;-1.0220152442761960554 -3.5987695510999939685 -8.1951676016634138477;1.0746219201960596212 3.595450628764051082 8.2859869863920465605;1.0336234293240340598 -1.3532054436055500624 2.2044905592794989957;-1.9220767328443499888 -1.2880950375940412034 1.5338419484590872788;-10.987485545923547647 3.0172351007467779205 3.0219409065692159899;0.89085181381040812187 0.79291498390286885289 -1.1647575345264946645;3.5833663340637200712 -0.94738574244407525171 -1.0535850036005960373;-1.6008179742877786111 7.8475920480484369079 -2.8926737617463240682;2.9442908726652619045 5.3550388747855102167 -10.27028378444354928;-0.7192639788056779393 -0.52468075412027836979 1.3152109258662572078;-0.50307749237918886198 -1.655263797523959246 -1.1079714713924835312;0.44210310036513517096 1.5550528354847912293 0.26488078504058260032;1.3525588564656032542 -2.8750276608468756656 0.24053328212189381552;-7.9982549208597362167 2.3824131452852572721 2.3952546416281412789];

% Layer 2
b2 = 0.93046010752213248463;
LW2_1 = [-0.89081565383384053725 0.26775790024482881702 -1.0958372970346710318 -1.3626213343300845882 2.273702001429685815 -2.3403412032043346969 -0.12087406105261420952 0.65081796163632299468 1.8052844595726365018 0.30564441864728042475 0.34870506739428097642 0.86848838500990233058 1.0332149829623595849 -1.9077831465426069446 -1.1438288357549692975 -0.14127361855773440391 -0.98325667918539105816 -0.97581353747103261043 -0.73118507831429790933 -0.64771997875236531073 -0.17922872895967090212 -0.99856281539622804289 1.1968316001172805141 0.017056682374609360986 0.013650793997748409542 -1.3570282657722643194 -0.96878226654404309137 -1.462074683584569712 -1.8913840912341930434 -0.14488095396620087607];

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
