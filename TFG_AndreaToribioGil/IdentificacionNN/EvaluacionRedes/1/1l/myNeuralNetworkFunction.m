function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 06-Jun-2022 23:06:10.
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
b1 = [0.059965243513989664736;0.68760199010836009492;-0.51249974001643339161;-0.23565963905034548187;-0.3237097779744105841;-0.10733957403649661833;0.49681461283349870328;0.22318778445580292336;-0.24309541406896365001;1.0473241402806943157;-0.15152837167640129112;-0.77889485518563428279;-0.49398144459210813206;-2.1294239762018958295;0.53695811049166830564;-1.2667737587753873374;-0.33744146899409349638;1.5437570593176237477;1.914925782112298025;-2.6197818795079470533;-1.7240427669119307019;-2.2288445460279433519;-0.1425872174975493234;-0.38267485039531135005;0.57976197623278202808;-0.37983401911360514802;-0.11312815348148369532;-0.13616015012872006995;0.37999460638059667783;-0.35592838705921248099];
IW1_1 = [0.13476886188853909321 -0.68693358360455558653 0.55927466270386072544;-0.99199153762653047295 -3.8707517483029860728 -8.5712936532307111293;-0.61804274154733807034 0.18276064814914716461 -0.73519626301475904384;0.17731039446717572483 -1.7752641758423111096 0.1354130103136161889;-1.372638143175016312 1.0789390745741584965 0.63755481639372546532;-0.15174645477488468703 -0.1786630214079656942 0.12318104251907033286;-1.8505434534314497697 -4.6860181512165430817 -10.010296055496848311;2.2449891281949727606 4.0065103786786595563 -7.6283317211918388878;0.033300560269605650188 -5.3823314142933176285 -1.6093307510522529835;0.13638236377156942591 0.71889167750939453327 -0.32133344097698379738;-2.8599726129247118322 4.2121784236872112928 -5.0395987171287357498;1.1705774019782442252 10.262626351835397287 2.9896431748025005248;-5.5614636598840361259 3.5796159789406956087 1.5605422985935897273;0.22928218219292237356 0.10945454055666903326 -2.0789682000258138395;5.8487260274454797582 -3.3102284563230464087 -1.2045727345707260003;-5.8658371306118475275 -1.964501470750722234 -2.0785538166317585329;0.26503757359270396776 10.083627344842415852 3.3093630745673068283;2.5526675754958922937 0.59369046987254325831 0.2772483389250856578;-2.7955989911606868858 -0.004982907575907219444 -0.15243053312428794799;-15.186275780898698784 -0.27165079324649732406 -1.2511443433442985818;0.63128330357362283376 -1.2083864017100744981 0.38865548405212790861;3.5272972115563363538 0.29507845150667139089 0.45364224398937053051;0.038979388573650582128 -1.6520753964676393455 0.7176709965693034432;-0.07901914644545166011 -6.1067193285892891197 -1.9582228379311648059;7.8961254538060305919 0.53103639974659733181 -2.1710168370758062828;0.090984203346440126192 -0.095591039658147122782 -1.7295063636775376281;0.0067856539677723743884 -1.4490315106932660782 1.0208413949405530374;0.22124528252091557601 -0.19873737173454028571 -0.025169732958455180022;0.69913407991534748387 0.34549024556379209772 0.047827303880976584916;-0.6240564441046090316 -0.29101910496020411134 -0.018314334006054686088];

% Layer 2
b2 = -0.24002725382969236634;
LW2_1 = [-1.0963985972834924265 -0.17397580665821540946 -1.6753827711702535819 1.9299301435896962786 0.28359035133758658809 0.27222983081777818448 0.1549103754520816667 0.017464347167074331657 -1.850411478685629163 2.2424256706032554831 -0.022901362990177875217 -0.054864629778638041024 -0.58680250581166182311 0.55829370492461094511 -0.62272351420766114405 -0.15482463624758643905 -0.14853958160613989214 0.33811348120382844762 1.3657213524791131931 -0.037225981401962142392 1.3590312462384952497 0.86434865927573867328 -1.3314714344136078239 1.4048127019088350043 -0.042065292425706515833 0.78957377027303154993 0.76015045564004835033 0.21542145009962482272 -0.59233088163033720264 0.50512493715472761568];

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
