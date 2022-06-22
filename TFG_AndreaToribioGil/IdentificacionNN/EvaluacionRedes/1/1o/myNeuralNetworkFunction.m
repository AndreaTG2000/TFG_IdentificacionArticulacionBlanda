function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 06-Jun-2022 23:29:40.
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
b1 = [-5.2986580222094472603;-5.0109739189494257872;-4.7402561228478150568;-4.526555099137488547;4.3364127325598795792;4.1645709541382736063;-3.9217368803517653753;-3.8836181226724453275;3.5637317183901373596;-3.6406566033516565284;-2.7716787475542448149;2.810231481579041013;-2.6303489792830614391;-2.5366951317170509661;-2.2373254787446557046;-2.0489081513616418384;2.0621663086198358528;1.469684404697527258;-1.6242153585389764725;-1.1704011743173119431;0.77360853293300246847;0.67052257532859338429;-0.84829718608049453632;-0.2422373905877980016;-0.010938499809177831476;0.17451935109556676595;-0.29239014603337531994;-0.48914174041715791086;0.86084901829435567233;1.015364558247965121;1.2757312497970620946;-1.6741541590627446734;1.6341887171806648293;-2.0735964693110240376;-2.1910915342653591864;-2.1514555802077452995;2.5121132268528452158;-2.6512736627325135252;2.7943325668352043678;-2.9966388888575492544;3.4316178005475808099;3.4766222319475432734;-3.7953422678072796792;4.3564681912729597002;4.1099816364529004886;-4.1049725232961016275;-4.8094429085923291467;4.7365728106131852471;5.0741229784161836491;-5.2988023053338952906];
IW1_1 = [1.013514631369620389 -4.7825352058412935463 -0.58902308744288001119;0.6723073871352757136 2.9745608004157184645 -4.0719290053172496613;2.3232304630035267579 4.455097627114890102 1.1577926662846458328;0.95344159404213058018 1.8787460013019652294 4.7074642287247341343;-0.38738837081941346341 3.2377326600525444533 -3.8447451395243663619;-2.6264176013745679228 -3.4560526578903214556 2.6584966398251186348;2.1770594475727151895 3.6167240364387156504 -2.8730427731360976829;1.4077848219710258348 -4.4177192140406305043 1.7126725356490002383;-1.3096538318475636764 1.1618758345085555828 -4.7484371798087128269;2.9358498331056650521 -1.1353612383705484756 -3.5492046782082335987;2.3070726399249763539 0.58130139117601853371 -4.6944631066769781924;-1.363364124088608742 2.4466816706358152089 -4.2931795062929261064;2.424768121862284076 4.1585906364652140965 1.8437452632905471095;4.4556586612059927432 0.19653501573770629229 -2.4473288709251046491;0.24314528410397889813 4.1915756659000260598 2.7602632003889824297;2.2661420640870941767 2.8353718263655607323 3.6585654021256646118;-3.5227469013029084621 -2.2390486920871386367 -2.9133569082998440614;-0.85832315141274018178 -4.7260853039514456597 1.9463406699554455237;3.8950151940370201231 -1.125031483344067551 2.9982308672988149389;4.1378530285290713309 -2.0519311276631646557 -2.250158489079800983;-3.7305437043957949683 -2.1611894711064696395 2.7362651858082696066;-1.3187035762556815754 3.413461214481254391 -3.6248257804520647163;2.2182489463778289895 3.018147715615440152 -3.3826318587408477079;4.9885821875460738539 -0.36355767770179830967 -1.0982053824521029739;-3.0696706403301172728 -4.1646988667867157474 -0.15406773007970275824;3.1514744059734725035 -1.3805543887936253533 3.8565955660094966007;-2.9314402447720735445 4.0751068450912404373 1.0533586118004161225;-1.2035091966642368355 4.0593610210223554091 -2.9303392918530826172;2.1387436899041993854 -2.5318456099593142916 -3.8354468201996700927;3.61113595780656782 -0.42888379495279776998 3.6198441553109295121;3.5229263391767902114 3.6876774282662996285 -0.06745227192619238088;-4.043759007516956494 -2.5639894621730801028 -1.5541779749738198202;1.3023525351872105027 3.4547814759630353088 3.4138791957285921086;-3.3269614519282924014 -3.2863126369669490856 1.9599639212785371356;-4.1180598796423852903 1.1520699178469688828 -2.7290667260594188015;-2.0274727741227112077 1.7013248508228018263 4.411727696915420438;1.9720254064651343562 0.3528005665804465063 4.7338057838721363524;-2.3941085010661802279 3.7667645548907340292 -2.5279548953387283028;2.0530819812231748678 2.7390872634767848837 -3.851165494666045408;-3.500283463981944454 -0.89918657074045604816 -3.6487213093571146949;3.0323639248077882691 3.3278409534067674436 -2.1686177631936924826;3.9284643845710691679 0.71518431609947685779 3.2527897278977229156;-1.2164605535854389196 3.5583212702060769139 -3.4060339924045295312;2.0075580287634191556 -4.006167703737144592 1.1769197057342486445;4.1995292453463166638 2.8919956922524581167 -0.38733190683346913064;-2.0270445165322170666 4.2795128052856190592 2.2935164646051826587;-2.8724734803385549853 3.9534534976752855329 -0.27322859475431199305;1.3704805404707274263 3.6283669138387222297 3.3995917414939564871;0.13671114006640122662 -2.9958727988662894326 -4.068705130743806464;-2.0037881695820960459 -2.985302484926916744 3.4194706909825520746];

% Layer 2
b2 = -0.15012793666628726497;
LW2_1 = [-0.32433023395346916029 0.093952080403020152288 0.21258698321129607112 0.0024029357690665536368 -0.59425883542917767866 0.12426437989222717528 0.19343039950163790075 -0.1469558557350861272 0.4970059773339297049 0.0086187658851163383156 0.076924049470395369776 -0.19147280356460785744 -0.16914141006343472173 -0.019907436937288750661 -0.030904732616832387981 0.089745520422801525195 -0.19343439267742509879 0.00019025863900068762965 -0.035866145694250235743 0.020769554425992469565 -0.15866602076481708949 -0.055693804081062510403 0.0014475134034689239506 -0.059249986650098639129 0.042474840668433329338 0.10625968471836863549 0.0031658799855635634014 -0.0042379904179899383077 0.085945459891234921024 -0.093617656363864626412 0.13422250361245943728 -0.35820140855682014447 -0.66552525958686170604 0.16046250339082424041 -0.073353512296473522003 -0.10151970933607619429 0.27511875721175826914 0.0041509252578523789592 0.024190410589827973653 0.38601500166367197497 -0.024117766706979352348 0.051907894271643807704 0.13343502336326007462 0.34733889296820957826 0.029376178769952202008 -0.096243922508071011457 0.25428660701456623494 -0.24268333111615680853 0.95386482743673361995 -0.12166327416958672147];

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
