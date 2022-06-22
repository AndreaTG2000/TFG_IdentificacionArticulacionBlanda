function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 06-Jun-2022 23:43:14.
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
b1 = [-4.3809186067144079146;3.866960658982020238;-4.0589738636960319695;3.059794105015542609;3.2078667382216319304;-2.810866799397864213;2.6541498471492408484;-2.4101615692599285268;2.4184543257813095885;2.2478878335224088403;0.99622095292629975205;-1.3135628014183837742;-0.0014678415512131455511;-0.233932926259385221;0.38818022859457224083;0.25561122100964089876;-0.26725747904764346474;0.64988654234435139223;-1.6854924047281101274;1.5735450077615473763;1.1138616584840941304;1.2575256414172215624;2.1220946399158044926;-2.8580979998942441789;2.4926156447699088226;-3.6364536852510140896;-3.4474336855918994438;3.0859708348456669214;4.0292344249203599915;-4.5875821658860669316];
IW1_1 = [3.1833192526301492542 2.0247688377915737945 2.1387606476310607739;-2.6456289263874745998 2.653195529732885749 2.0803733600963263406;0.37932750597874281828 -3.0592060762700707954 -2.7773784057194448316;-1.7627606860783262555 3.93849883389264388 -1.1062665875680419703;-2.5678738183342257884 2.042286632510053046 2.7463926284786968068;0.29496259623925258353 -1.226886928501119467 -4.0805928578799672835;-2.453628500811010138 -2.7356880240515333291 -2.2594762952509159781;1.7860535000007626838 -1.0996127609436825434 -3.7249790675816005781;-2.355570293712939467 -1.7421512691475462553 -2.7670977929394093842;-2.0146212703076455952 0.0095457621005782221368 -3.3887189441198231066;-0.36096446543674093332 -2.702609161697294482 3.4375306867889054985;2.8979294931856975914 -2.0328907593678651189 2.1826154077808905818;-1.6023282960621656468 3.9524357717103990595 -1.1242695984722446134;0.4001310665739796768 0.72942931733353322254 4.2908084259342045286;-2.8797182099358451524 -1.9096967913600808586 -2.6277135810402150184;3.0282311356208522213 2.8521460040719022189 0.93724700393019932942;-0.22760452741545111888 3.2366598752231521274 -2.7265546170272010329;0.38941963515663940987 1.9395862401214103432 3.6374560311035883942;-3.3113361596881323301 -1.9002894324099495194 1.2463190722834094348;2.825754425174650919 1.8320251534916114355 -2.6241603619581530538;1.2791418785839239192 -3.2998542421270866676 -3.0758698002672848482;2.4525633426613340227 -2.4573663640515421847 -2.2507079035229629049;1.5215084130573082177 2.9245526760343358852 -2.8213960285429755537;-1.939116971364652553 2.2321119892095966364 2.485917848478861103;3.521161354421496803 0.60629170029297740907 2.6115138454328707951;-4.4444538526215540131 0.76035099520075932755 0.56475250317988345827;-1.0043540651905111805 3.8406037269294031056 1.8102591562301131312;4.0968893152531276058 -0.33112468503687109145 -0.092198753980962194765;2.6052177645244798398 1.6729136000666908757 3.0761472337067021776;-0.90437545993474366401 -3.7614390625285700764 -1.6413800656023809221];

% Layer 2
b2 = 0.55310759905471695852;
LW2_1 = [0.45281388475502520885 -0.054095079370508794558 0.10386570878845165222 -0.078357265271218543012 -0.0099955414872959016948 0.100324467648348431 -0.11365015816410427296 -0.014575685631249196694 0.23508164880993079326 -0.078491617965983292993 -0.012353663707285201731 0.11764458492931743894 -0.11165835910676465137 -0.081327970659968440437 0.13312442485688594229 0.040323056470009166485 -0.024261004544433778518 -0.28191231895004936758 -0.16282803591846300995 -0.13660927277180806572 -0.69994833592565608438 0.75499987891739928081 -0.024222510197785922237 -0.27080141235163379676 0.11824544038197359885 0.52699032291560599095 0.11646634313337578259 0.63929471501113399601 -0.48343257711511145036 -0.52745950158569232524];

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
