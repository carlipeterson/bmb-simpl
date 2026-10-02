function [rho,alpha,eta,beta,sigma,gamma,epsilon,rhom,mu,theta,K1,K2,Error2] = newSIMPL_MultiStart(datamatrix,I0,P0,L0,OD0,tspan,lb,ub,w,nu,NoStartPoints)

%% Upper and Lower bounds for parameters you are fitting.

%Parameter vector we are approximating:
% z = [rho,alpha,eta,beta,sigma,gamma,epsilon,rhom,mu,theta]

LowerBounds=lb;      %Lowerbounds for the parameters you are estimating
UpperBounds=ub;       %Upperbounds for the parameters you are estimating

xstart=.5*(LowerBounds+UpperBounds);                            %What initial parameter values you want to start with

%% MultiStart and fmincon - Fitting Part - Parallelization - not many comments ask Prof. Edholm for clarification if you want.

% Here we set-up the optimization problem, specifying we will use fmincon
% as the local solver, and the what model we want to minimize along with
% the specific measure down below in the SIR_RUN_ODE15 function. We give
% initial conditions and the bounds.

Trial7=[8000000 11800000    12800000    14266666.6666667    19133333.3333333    24000000    33533333.3333333    48266666.6666667    54133333.3333333    64600000    87200000    111600000    135133333.333333    152466666.666667    169200000    187133333.333333    200000000    210466666.666667    222333333.333333    233866666.666667    250200000    261333333.333333    281733333.333333    283133333.333333    285066666.666667    284266666.666667    289000000    292200000    291666666.666667    293666666.666667    296200000    298666666.666667    299200000    302800000    306000000    307666666.666667    308733333.333333    310933333.333333];
Trial5=[8000000 11733333.3333333    13466666.6666667    15866666.6666667    20200000    24733333.3333333    37133333.3333333    56200000    50200000    36933333.3333333    34400000    32866666.6666667    32400000    31733333.3333333    31200000    31200000    31333333.3333333    31533333.3333333    32000000    32800000    33733333.3333333    35133333.3333333    36733333.3333333    38400000    40333333.3333333    42466666.6666667    45466666.6666667    49333333.3333333    54266666.6666667    60000000    66266666.6666667    73066666.6666667    80266666.6666667    87666666.6666667    95333333.3333333    103866666.666667    113466666.666667    122533333.333333];
Trial4=[8000000 11666666.6666667    12800000    14200000    19266666.6666667    26666666.6666667    40333333.3333333    29133333.3333333    20600000    19533333.3333333    19800000    19933333.3333333    20266666.6666667    20666666.6666667    21200000    21666666.6666667    22266666.6666667    23066666.6666667    24200000    25733333.3333333    27733333.3333333    30266666.6666667    33066666.6666667    36400000    40933333.3333333    47533333.3333333    56466666.6666667    67266666.6666667    78400000    89066666.6666667    98600000    107733333.333333    116266666.666667    124933333.333333    134133333.333333    142066666.666667    149400000    155800000];
Trial3=[8000000 11066666.6666667    12266666.6666667    14000000    18866666.6666667    25866666.6666667    17266666.6666667    13066666.6666667    12666666.6666667    12933333.3333333    13200000    13666666.6666667    14133333.3333333    14466666.6666667    14866666.6666667    15466666.6666667    15866666.6666667    16733333.3333333    17733333.3333333    19000000    20800000    23200000    26533333.3333333    30400000    35533333.3333333    42400000    51600000    63266666.6666667    75733333.3333333    87933333.3333333    99400000    109266666.666667    118466666.666667    127466666.666667    137866666.666667    142733333.333333    149733333.333333    156466666.666667];
Trial2=[8000000 11333333.3333333    12533333.3333333    15066666.6666667    22000000    15200000    10733333.3333333    10466666.6666667    10666666.6666667    10933333.3333333    11133333.3333333    11266666.6666667    11666666.6666667    11933333.3333333    12400000    12800000    13400000    14066666.6666667    15133333.3333333    16666666.6666667    18533333.3333333    21000000    24200000    27866666.6666667    32666666.6666667    38400000    46466666.6666667    56866666.6666667    69266666.6666667    82266666.6666667    96533333.3333333    107000000    117600000    129866666.666667    138133333.333333    146133333.333333    153866666.666667    160800000];
Trial1=[8000000 11133333.3333333    12733333.3333333    16066666.6666667    11000000    8733333.33333333    8666666.66666667    8666666.66666667    8866666.66666667    9000000    9066666.66666667    9400000    9733333.33333333    10000000    10400000    10933333.3333333    11666666.6666667    12666666.6666667    14200000    16266666.6666667    18733333.3333333    21800000    25666666.6666667    29600000    34533333.3333333    40333333.3333333    48266666.6666667    58200000    69866666.6666667    81866666.6666667    94133333.3333333    105533333.333333    117066666.666667    126400000    136600000    144866666.666667    153133333.333333    161066666.666667];
S0=[Trial7(1);Trial5(1);Trial4(1);Trial3(1);Trial2(1);Trial1(1)];

%creating new initial values to include estimation of initial value of R
new_initialvalues = @(r) [S0-(r.*S0), I0, r.*S0, P0, L0, OD0]';

problem = createOptimProblem('fmincon','objective',@(z) SIMPL_RUN_ODE15(z,datamatrix,new_initialvalues(z(10)), tspan,w,nu)...
    ,'x0',xstart,'lb',LowerBounds,'ub',UpperBounds);%,'Aineq',A,'bineq',b)%,'Aeq',Aeq,'beq',beq);

% problem.options = optimoptions(problem.options,'TolFun',1e-16, 'TolX', 1e-16);%'MaxFunEvals',9999,'MaxIter',9999);%,'TolCon',0)
problem.options = optimoptions(problem.options,'MaxFunEvals',9999,'MaxIter',9999);%,'TolCon',0)
%problem.options = optimoptions(problem.options,'MaxFunEvals',inf,'MaxIter',inf,'TolFun',1e-10,'TolCon',0,'TolX',0,'MaxFunEvals',999999)

numstartpoints=NoStartPoints;                               % How many runs do you want?

% %  ms=MultiStart('Display','iter');                       %defines a multistart problem without parallel

ms=MultiStart('UseParallel',false,'Display','iter');         %defines a parallel multistart problem

%parpool %accesses the cores for parallel on your computer (laptop goes for 2-8, can be more specific)

[b,fval,exitflag,output,manymins]=run(ms,problem,numstartpoints);  %runs the multistart

% the following takes solutions from manymins and makes a matrix out of them


for i=1:length(manymins)
    SIMPLParameters(i,:)=manymins(i).X;       %what are the parameter values
end

for i=1:length(manymins)
    fvalues(i)=manymins(i).Fval;            %the minimization error
end

for i=1:length(manymins)
    ExitFlags(i)=manymins(i).Exitflag;      %how "good" is the solution, we want 1 or 2.
end


%delete(gcp('nocreate'))  %turns off the parallel feature


%% Plot the "best" solution

%%Outputs state variables for "best" fit
n=38;   %number of timepoints to plot
CM=jet(6);  %vector of different colors
% %Outputs state variables for "best" fit

ini_val = new_initialvalues(SIMPLParameters(1,10));
%errorForPlot = -1*ones(1,height(datamatrix)); errorForPlot2 = -1*ones(1,height(datamatrix));
for i=1:6
    [t,y(:,:,i)] = ode15s(@(t,y) SIMPL_Model(t,y,SIMPLParameters(1,:)),tspan(1:n),ini_val(:,i));
    S(:,i) = y(:,1,i);
    I(:,i) = y(:,2,i);
    M(:,i) = y(:,3,i);
    P(:,i) = y(:,4,i);
    L(:,i) = y(:,5,i);
    OD(:,i) = y(:,6,i);
    %errorForPlot(i,j) = rl2Err(OD(j,i),datamatrix(i,j)); %error for each trial at each timepoint
    %errorForPlot2(i) = rl2Err(OD(:,i),datamatrix(i,:)); %total error for each trial
    plot(tspan(1:n),OD(:,i), 'color', CM(i,:))   %plots "best fit"
    hold on
end

%plot the actual data
for i=1:6
    scatter(tspan(1:n),datamatrix(i,:),'MarkerFaceColor',CM(i,:))
    hold on
end
legend('No phages','10^2', '10^3', '10^4', '10^5', '10^6', 'Location','northwest')
xlabel('Half-Hours')
ylabel('CFU/mL')
title('Best Fit (continuous curve) with Lab Data (dots)')

Error2 = rl2Err(OD, datamatrix);
% PortionofErrorfromFirstPart2 = rl2Err(OD(1:28,:),datamatrix(:,1:28))
% PortionofErrorfromSecondPart2 = rl2Err(OD(29:37,:),datamatrix(:,29:37))

% figure(2)
% for i=1:6
% plot(tspan(1:n), errorForPlot(i,:),'color',CM(i,:))
% hold on
% end
% legend('No phages','10^2', '10^3', '10^4', '10^5', '10^6', 'Location','northwest')
% xlabel('Half-Hours')
% ylabel('Error %')
% title('Relative Error of Each Trial Across Timeseries')
% figure(3)
% for i=1:6
% scatter(i,errorForPlot2(i),'MarkerEdgeColor',CM(i,:),'MarkerFaceColor',CM(i,:))
% hold on
% end
% xticklabels({'0', '10^2', '10^3', '10^4', '10^5', '10^6'})
% xlabel('Number of Phages')
% ylabel('Error %')
% title('Relative Error of Each Trial')


%%define SIMLPParameters
rho = SIMPLParameters(1,1);
alpha= SIMPLParameters(1,2);
eta = SIMPLParameters(1,3);
beta = SIMPLParameters(1,4);
sigma = SIMPLParameters(1,5);
gamma = SIMPLParameters(1,6);
epsilon = SIMPLParameters(1,7);
rhom = SIMPLParameters(1,8);
mu = SIMPLParameters(1,9);
theta = SIMPLParameters(1,10);
K1 = SIMPLParameters(1,11);
K2 = SIMPLParameters(1,12);