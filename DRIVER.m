% Data fitting: Parameter estimation in SIMLP model for Optical Density data.
% RTG Bacteriophage Project
clear% Data fitting: Parameter estimation in SIMLP model for Optical Density data.
% RTG Bacteriophage Project
clear
clc
close all
format long
%% Given Data from Dr. Allen's Experiment (Using Conversion Equation from OD to CFU/mL)
%Trial1 - 10^6 phages
Trial1=[8000000 11133333.3333333    12733333.3333333    16066666.6666667    11000000    8733333.33333333    8666666.66666667    8666666.66666667    8866666.66666667    9000000    9066666.66666667    9400000    9733333.33333333    10000000    10400000    10933333.3333333    11666666.6666667    12666666.6666667    14200000    16266666.6666667    18733333.3333333    21800000    25666666.6666667    29600000    34533333.3333333    40333333.3333333    48266666.6666667    58200000    69866666.6666667    81866666.6666667    94133333.3333333    105533333.333333    117066666.666667    126400000    136600000    144866666.666667    153133333.333333    161066666.666667];
%Trial2 - 10^5 phages
Trial2=[8000000 11333333.3333333    12533333.3333333    15066666.6666667    22000000    15200000    10733333.3333333    10466666.6666667    10666666.6666667    10933333.3333333    11133333.3333333    11266666.6666667    11666666.6666667    11933333.3333333    12400000    12800000    13400000    14066666.6666667    15133333.3333333    16666666.6666667    18533333.3333333    21000000    24200000    27866666.6666667    32666666.6666667    38400000    46466666.6666667    56866666.6666667    69266666.6666667    82266666.6666667    96533333.3333333    107000000    117600000    129866666.666667    138133333.333333    146133333.333333    153866666.666667    160800000];
%Trial3 - 10^4 phages
Trial3=[8000000 11066666.6666667    12266666.6666667    14000000    18866666.6666667    25866666.6666667    17266666.6666667    13066666.6666667    12666666.6666667    12933333.3333333    13200000    13666666.6666667    14133333.3333333    14466666.6666667    14866666.6666667    15466666.6666667    15866666.6666667    16733333.3333333    17733333.3333333    19000000    20800000    23200000    26533333.3333333    30400000    35533333.3333333    42400000    51600000    63266666.6666667    75733333.3333333    87933333.3333333    99400000    109266666.666667    118466666.666667    127466666.666667    137866666.666667    142733333.333333    149733333.333333    156466666.666667];
%Trial4 - 10^3 phages
Trial4=[8000000 11666666.6666667    12800000    14200000    19266666.6666667    26666666.6666667    40333333.3333333    29133333.3333333    20600000    19533333.3333333    19800000    19933333.3333333    20266666.6666667    20666666.6666667    21200000    21666666.6666667    22266666.6666667    23066666.6666667    24200000    25733333.3333333    27733333.3333333    30266666.6666667    33066666.6666667    36400000    40933333.3333333    47533333.3333333    56466666.6666667    67266666.6666667    78400000    89066666.6666667    98600000    107733333.333333    116266666.666667    124933333.333333    134133333.333333    142066666.666667    149400000    155800000];
%Trial5 - 10^2 phages
Trial5=[8000000 11733333.3333333    13466666.6666667    15866666.6666667    20200000    24733333.3333333    37133333.3333333    56200000    50200000    36933333.3333333    34400000    32866666.6666667    32400000    31733333.3333333    31200000    31200000    31333333.3333333    31533333.3333333    32000000    32800000    33733333.3333333    35133333.3333333    36733333.3333333    38400000    40333333.3333333    42466666.6666667    45466666.6666667    49333333.3333333    54266666.6666667    60000000    66266666.6666667    73066666.6666667    80266666.6666667    87666666.6666667    95333333.3333333    103866666.666667    113466666.666667    122533333.333333];
% Trial6 - 10^1 phages
Trial6=[8000000 11666666.6666667    13333333.3333333    15600000    20066666.6666667    23933333.3333333    36866666.6666667    48866666.6666667    57800000    76600000    86133333.3333333    87466666.6666667    82533333.3333333    73666666.6666667    66133333.3333333    60933333.3333333    57533333.3333333    55400000    54266666.6666667    52933333.3333333    51733333.3333333    51000000    50800000    49933333.3333333    50200000    49666666.6666667    49200000    49400000    50533333.3333333    51933333.3333333    53866666.6666667    56866666.6666667    59733333.3333333    64733333.3333333    68933333.3333333    72666666.6666667    79200000    86200000];
%Trial7 - No phages
Trial7=[8000000 11800000    12800000    14266666.6666667    19133333.3333333    24000000    33533333.3333333    48266666.6666667    54133333.3333333    64600000    87200000    111600000    135133333.333333    152466666.666667    169200000    187133333.333333    200000000    210466666.666667    222333333.333333    233866666.666667    250200000    261333333.333333    281733333.333333    283133333.333333    285066666.666667    284266666.666667    289000000    292200000    291666666.666667    293666666.666667    296200000    298666666.666667    299200000    302800000    306000000    307666666.666667    308733333.333333    310933333.333333];

datamatrix=[Trial7;Trial5;Trial4;Trial3;Trial2;Trial1]; %matrix of the data 7x37
%datamatrix=datamatrix(:,1:2);
%datamatrix=datamatrix(:,2:37); %matrix without initial values

%Time
thirtyminute = length(Trial1);           %%how many timepoints
tspan = 1:1:thirtyminute;       %%vector - how many timepoints you are simulating, will be inputed into ode15s
%Initial Values
% S0=[Trial7(1);Trial6(1);Trial5(1);Trial4(1);Trial3(1);Trial2(1);Trial1(1)]; %%initial number of susceptible bacteria 7x1
% I0=zeros(7,1);   %%initial number of infected bacteria 7x1
% L0=zeros(7,1);  %%initial number of lysed bacteria 7x1
% P0=[0;10^1;10^2;10^3;10^4;10^5;10^6]; %%initial number of phages 7x1
% OD0=[Trial7(1);Trial6(1);Trial5(1);Trial4(1);Trial3(1);Trial2(1);Trial1(1)]; %%initial optical density 

S0=[Trial7(1);Trial5(1);Trial4(1);Trial3(1);Trial2(1);Trial1(1)]; %%initial number of susceptible bacteria 7x1
I0=zeros(6,1);   %%initial number of infected bacteria 7x1
L0=zeros(6,1);  %%initial number of lysed bacteria 7x1
P0=[0;10^2;10^3;10^4;10^5;10^6]; %%initial number of phages 7x1
OD0=[Trial7(1);Trial5(1);Trial4(1);Trial3(1);Trial2(1);Trial1(1)]; %%initial optical density 

initialvalues = [I0 P0 L0 OD0]'; %%intial value matrix 5x7
%size must be sxn where s is the number of solution componants and 
%n is the number of initial conditions being solved for. Each column in the
%matrix then respresents one complete set of initial conditions.

%% Data-fitting

% Running the multistart algorithm

strParams = ["$\rho$","$\alpha$","$\eta","$\beta$","$\sigma$","$\gamma$","$\epsilon$","$\rho_M$","$\mu$","$\theta$","K_1","K_2"];
lb=[0,0,0,0,0,0,0,0,0,0,2.5e8,1e7];
ub=[1,1e-6,3,250,1e-5,1e-4,0.5,1,1e-4,1e-3,3.5e8,3.5e8];
% lb=[0,0,25,0,0,0.1,0.1,0,0,1e7];
% ub=[1e-3,2,125,1e-2,1e-2,1,0.5,1e-2,1e-3,3e8];
% Data-fitting and regularization weight
%w = 10e5;
nu = 0.1;
% [rho,alpha,eta,beta,sigma,gamma,epsilon,rhom,mu,theta,K1,K2,tau] = SIMLP_MultiStart(datamatrix,I0, L0, P0, OD0,tspan,lb,ub,w,nu) %global minimum
%[rho,alpha,eta,beta,sigma,gamma,epsilon,rhom,mu,theta,K1,K2] = SIMPL_MultiStart(datamatrix,I0, P0, L0, OD0,tspan,lb,ub,w,nu) %global minimum

n=25;                                % n trials of the multistart algorithm
runs = randi([25 30],1,ceil(n/3));  % number of runs of parameter estimation for each trial of the multistart algoritm, can be a vector or scalar
paramsAndErr = zeros(n,length(strParams)+2);  % matrix holding values of each parameter and relative l2 error percent for each trial of the multistart alogrithm
% NoStartPoints = randi([10 25],1,3);              % number of runs of parameter estimation for each trial of the multistart algoritm, can be a vector or scalar
%NoStartPoints = 10;

for i=0:n-1
    i
    w = 10^(i-1); % makes data-fitting weight cycle from 10^(-10) to 10^(-10+n-1), used to find optimal omega <- for now optimal omega = 10^(-5)
    [paramsAndErr(i+1,1), paramsAndErr(i+1,2), paramsAndErr(i+1,3), paramsAndErr(i+1,4), paramsAndErr(i+1,5), paramsAndErr(i+1,6), paramsAndErr(i+1,7), paramsAndErr(i+1,8), paramsAndErr(i+1,9), paramsAndErr(i+1,10), paramsAndErr(i+1,11), paramsAndErr(i+1,12), paramsAndErr(i+1,13)] = newSIMPL_MultiStart(datamatrix, I0, P0, L0, OD0, tspan, lb, ub,w,nu,runs(mod(i,length(runs))+1));
    paramsAndErr(i+1,14) = w;
end

[min, minRow] = min(paramsAndErr(:,13)); % find run with the smallest error
minRow; % outputs the row number with the smallest error

% the "optimal" parameter values
rho = paramsAndErr(minRow,1)
alpha = paramsAndErr(minRow,2)
eta = paramsAndErr(minRow,3)
beta = paramsAndErr(minRow,4)
sigma = paramsAndErr(minRow,5)
gamma = paramsAndErr(minRow,6)
epsilon = paramsAndErr(minRow,7)
rhom = paramsAndErr(minRow,8)
mu = paramsAndErr(minRow,9)
theta = paramsAndErr(minRow,10)
K1 = paramsAndErr(minRow,11)
K2 = paramsAndErr(minRow,12)
w = paramsAndErr(minRow,14)
%[paramsAndErr(minRow,1),paramsAndErr(minRow,2),paramsAndErr(minRow,3),paramsAndErr(minRow,4),paramsAndErr(minRow,5),paramsAndErr(minRow,6),paramsAndErr(minRow,7),paramsAndErr(minRow,8),paramsAndErr(minRow,9),paramsAndErr(minRow,10),paramsAndErr(minRow,11),paramsAndErr(minRow,12)]


writematrix(paramsAndErr, 'Trial.csv')      % creates a .csv file of the parameter and relative l2 error percent values
