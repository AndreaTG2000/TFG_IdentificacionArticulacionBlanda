function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 01-May-2022 19:01:08.
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
b1 = [-8.8013245110575972774;-6.0751137084318669324;1.776869991356526457;-0.60364599898485027385;-0.56670427547132662394;25.122075783293087881;3.1765977612488520698;-1.1527691871448229044;-1.1672479171752292437;-2.7648734016006359937;1.5638909628476487246;-0.2834881048561198047;1.1090302678186285679;-1.0777748218058402774;0.055405940959011724944;-1.0867645113253638911;0.48763157723371802765;2.3970773985846984822;0.61800635679696058755;3.6300830941985546829;4.103680117169959729;-3.6931412713524669478;1.240832516141547659;2.2852859736376252009;1.2666217324145856438;2.5779313149393519033;2.2334989673642002828;-4.5788096809765690409;6.1883715043271383394;-7.9728319805942584608];
IW1_1 = [4.1176177703077740944 3.3175757555248401864 -2.0530143192830960785;8.7494622345160060206 -3.472463097068116511 -4.1453215782690513436;-0.067591521456538655732 0.82504066736672410087 2.2511706639612527603;-0.39092434871539888386 -4.1821388575446185598 -0.0857809868973266193;-0.43127485114144681333 -4.0604101507037242413 -0.16510279557693655073;-19.972569478033832979 13.103588815748313579 15.573331899668286127;-5.8739362800370953366 2.379333002162066002 2.8395086262063058413;0.17452998692062896002 -0.6157876896631160335 -3.1830770300862569755;1.5444542670466707701 0.24446694106528360502 -6.4875835037298079655;5.0109747537771953674 -2.0103313166144727298 -2.4178598821592363066;-3.0393437442063300225 1.2198039813966339295 1.6012132958910252345;3.9726160199127757977 -0.58993978588407558483 -0.27451164827515761591;-1.1016556963299624083 -9.7379682343798865674 -3.3982568666781634015;1.2821586177402879425 10.131370033257335095 3.5941482964096498343;-1.9668098246953056307 -10.9458843960688057 -6.6282558393488715254;-8.2777302079185375305 2.0414487066632136525 -0.84232110357427747438;-1.0757235396155695462 -2.8466873776712624533 -8.8166545229156056962;-5.7891639874290268253 -12.830822282960308911 -23.693474138450810074;2.1080700085083887707 0.19215960275254959089 0.46541384843990946107;11.887774028558762751 6.6865634947291558987 0.99099773492983422862;5.5742567096148603056 -9.3627480504444129394 -6.7821068605225978132;-17.073271439817538919 -4.8136659852062040343 -0.85384017771381770512;2.7984547870720981599 -0.18468848213521890655 0.37505486901645762599;7.3831268702752019806 0.90061287647350318775 5.9772809531727784105;-0.16347420742812479588 -1.7681485186987984104 1.16761284829893075;4.2113742793678010656 2.1392086834404193674 -1.2005504581873738257;1.2430852063742023894 4.4594847775810997348 0.67904676065667290974;-4.3355917703149815523 -2.9896061858794729105 0.32278527820636015999;6.5102647602427019535 3.7616695054332152104 -2.375205385763458299;-0.64401818432316604301 -2.9928714856590694637 7.8146408796023081322];

% Layer 2
b2 = -1.0915334731855883543;
LW2_1 = [-1.3039594119388415727 0.28659228243365991728 -0.37008157747931619275 -2.0121963753053759838 2.3244386537874723864 0.017381614597527954291 -3.0251707370277616249 0.21589909844618823676 0.051640551628643692472 -4.4248792968415520122 -1.1998148466633220544 -0.42340783084283273308 -0.70447745134838046788 -0.67147845000306771723 0.019973777289850110778 0.08658713037424034531 0.1155253238108876479 -0.021827792784172826007 1.3938554908905476104 0.020552228272621202165 -0.029718645868664957804 -0.015905420791137294539 -0.60010703904580120494 0.019931818804844573384 0.10979135142193144348 0.11548607666723335885 -0.14138927334782572243 -0.13010730438668574593 0.041275067702109133339 -0.0067349859127155096983];

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
