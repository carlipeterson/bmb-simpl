clear; close all; format long;

%% raw data -> matrix

% trial1 = [0.1263 0.134 0.1507 0.1253 0.114 0.1137 0.1137 0.1147 0.1153 0.1157 0.1173 0.119 0.1203 0.1223 0.125 0.1287 0.134 0.1413 0.1517 0.1643 0.1797 0.199 0.2187 0.243 0.2723 0.3117 0.3613 0.4197 0.4797 0.5413 0.598 0.656 0.7023 0.7533 0.795 0.836 0.8757];
% trial2 = [0.1273 0.133 0.1457 0.1803 0.1463 0.124 0.1227 0.1237 0.125 0.126 0.1267 0.1287 0.13 0.1323 0.1343 0.1373 0.141 0.146 0.1537 0.1633 0.1757 0.1917 0.21 0.2337 0.2627 0.3027 0.3547 0.4167 0.4817 0.5533 0.6053 0.6587 0.7197 0.761 0.8013 0.8397 0.8743];
% trial3 = [0.126	0.1317 0.1403 0.1647 0.1997 0.1567 0.1357 0.1337 0.135 0.1363 0.1387 0.141 0.1427 0.1447 0.1477 0.1497 0.1543 0.159	0.1653 0.1747 0.1867 0.2033 0.2227 0.248 0.2827 0.3283 0.3867 0.449	0.51 0.5677 0.6167 0.663 0.7077 0.7597 0.7843 0.819 0.8527];
% trial4 = [0.129	0.1343 0.1413 0.1667 0.2037 0.272 0.216	0.1733 0.168 0.1693 0.17 0.1717	0.1737 0.1763 0.1787 0.1817	0.186 0.1913 0.199 0.2093 0.222	0.236 0.2527 0.275 0.3083 0.3527 0.4067	0.4623 0.5157 0.5637 0.609 0.652 0.695 0.741 0.781 0.8173 0.8493];
% trial5 = [0.1293 0.1377 0.1497 0.1713 0.194 0.256 0.3513 0.3213 0.255 0.2423 0.2347 0.2323 0.229 0.2263 0.2263 0.227 0.2283 0.2303 0.2343 0.2393 0.2463 0.2543 0.2627 0.272 0.283 0.2977 0.317 0.3417 0.3703 0.402 0.4357 0.472 0.5087 0.547 0.59 0.6377 0.683];
% trial7 = [0.1303 0.14 0.1537 0.1777 0.1967 0.2417 0.3023 0.3357 0.416 0.4927 0.541 0.5937 0.6437 0.6917 0.7357 0.7747 0.7867 0.857 0.8697 0.918 0.9823 1.05 1.0763 1.0767 1.1257 1.2433 1.2223 1.139 1.1687 1.276 1.15 1.1407 1.1377 1.1887 1.2063 1.2327 1.2743];
% datamatrix = linODtoCFU([trial7;trial5;trial4;trial3;trial2;trial1]); % bacterial count with each row representing a trial bacterial pop estimates

% od data converted to CFU/mL (Carli's conversion)
Trial1=[8000000 11133333.3333333    12733333.3333333    16066666.6666667    11000000    8733333.33333333    8666666.66666667    8666666.66666667    8866666.66666667    9000000    9066666.66666667    9400000    9733333.33333333    10000000    10400000    10933333.3333333    11666666.6666667    12666666.6666667    14200000    16266666.6666667    18733333.3333333    21800000    25666666.6666667    29600000    34533333.3333333    40333333.3333333    48266666.6666667    58200000    69866666.6666667    81866666.6666667    94133333.3333333    105533333.333333    117066666.666667    126400000    136600000    144866666.666667    153133333.333333    161066666.666667];
Trial2=[8000000 11333333.3333333    12533333.3333333    15066666.6666667    22000000    15200000    10733333.3333333    10466666.6666667    10666666.6666667    10933333.3333333    11133333.3333333    11266666.6666667    11666666.6666667    11933333.3333333    12400000    12800000    13400000    14066666.6666667    15133333.3333333    16666666.6666667    18533333.3333333    21000000    24200000    27866666.6666667    32666666.6666667    38400000    46466666.6666667    56866666.6666667    69266666.6666667    82266666.6666667    96533333.3333333    107000000    117600000    129866666.666667    138133333.333333    146133333.333333    153866666.666667    160800000];
Trial3=[8000000 11066666.6666667    12266666.6666667    14000000    18866666.6666667    25866666.6666667    17266666.6666667    13066666.6666667    12666666.6666667    12933333.3333333    13200000    13666666.6666667    14133333.3333333    14466666.6666667    14866666.6666667    15466666.6666667    15866666.6666667    16733333.3333333    17733333.3333333    19000000    20800000    23200000    26533333.3333333    30400000    35533333.3333333    42400000    51600000    63266666.6666667    75733333.3333333    87933333.3333333    99400000    109266666.666667    118466666.666667    127466666.666667    137866666.666667    142733333.333333    149733333.333333    156466666.666667];
Trial4=[8000000 11666666.6666667    12800000    14200000    19266666.6666667    26666666.6666667    40333333.3333333    29133333.3333333    20600000    19533333.3333333    19800000    19933333.3333333    20266666.6666667    20666666.6666667    21200000    21666666.6666667    22266666.6666667    23066666.6666667    24200000    25733333.3333333    27733333.3333333    30266666.6666667    33066666.6666667    36400000    40933333.3333333    47533333.3333333    56466666.6666667    67266666.6666667    78400000    89066666.6666667    98600000    107733333.333333    116266666.666667    124933333.333333    134133333.333333    142066666.666667    149400000    155800000];
Trial5=[8000000 11733333.3333333    13466666.6666667    15866666.6666667    20200000    24733333.3333333    37133333.3333333    56200000    50200000    36933333.3333333    34400000    32866666.6666667    32400000    31733333.3333333    31200000    31200000    31333333.3333333    31533333.3333333    32000000    32800000    33733333.3333333    35133333.3333333    36733333.3333333    38400000    40333333.3333333    42466666.6666667    45466666.6666667    49333333.3333333    54266666.6666667    60000000    66266666.6666667    73066666.6666667    80266666.6666667    87666666.6666667    95333333.3333333    103866666.666667    113466666.666667    122533333.333333];
Trial6=[8000000 11666666.6666667    13333333.3333333    15600000    20066666.6666667    23933333.3333333    36866666.6666667    48866666.6666667    57800000    76600000    86133333.3333333    87466666.6666667    82533333.3333333    73666666.6666667    66133333.3333333    60933333.3333333    57533333.3333333    55400000    54266666.6666667    52933333.3333333    51733333.3333333    51000000    50800000    49933333.3333333    50200000    49666666.6666667    49200000    49400000    50533333.3333333    51933333.3333333    53866666.6666667    56866666.6666667    59733333.3333333    64733333.3333333    68933333.3333333    72666666.6666667    79200000    86200000];
Trial7=[8000000 11800000    12800000    14266666.6666667    19133333.3333333    24000000    33533333.3333333    48266666.6666667    54133333.3333333    64600000    87200000    111600000    135133333.333333    152466666.666667    169200000    187133333.333333    200000000    210466666.666667    222333333.333333    233866666.666667    250200000    261333333.333333    281733333.333333    283133333.333333    285066666.666667    284266666.666667    289000000    292200000    291666666.666667    293666666.666667    296200000    298666666.66667    299200000    302800000    306000000    307666666.666667    308733333.333333    310933333.333333];
datamatrix = [Trial7;Trial5;Trial4;Trial3;Trial2;Trial1]; % matrix of observed bacterial counts, rows representing each experiment
tspan = 1:length(datamatrix(1,:)); tspan = 1/2*(tspan-1); % timespan of experiment

%% parameters

% params from august manuscript
% rho = 2*0.2701294;      % bacterial reproduction
% alpha = 2*0.0005509; % infection rate
% eta = 2*0.7199585;      % burst rate
% beta = 50.1023492;     % burst size
% sigma = 2*0.0079264;    % phage attachment rate
% gamma = 2*0.0062733;    % OD decay
% epsilon = 0.3625533;    % contribution of lysed to optical density
% rhom = 3679937;     % mutant reproduction
% mu = 0.0001278;     % mutation rate
% theta = 0.0003770;   % initial mutated pop proportion
% K1 = 2.903631498093575e+08;       % susceptible capacity
% K2 = 1.427547732370261e8;       % mutated capacity
% %tau = 0;                        % contribution of lysed to carrying capacity

% revised params dec 2024
rho = 0.266730140557391*2;
alpha = 2*2.717158230728653e-07;
eta = 0.419834880151364*2;
beta = 1.365041439472762e+02;
sigma = 2*6.451670015859878e-06;
gamma = 2*6.255458415728088e-05;
epsilon = 0.311673247774640;
rhom = 0.357074264336537*2;
mu = 5.409633609600061e-08;
xi = 6.922057130443650e-04;
K1 = 3.020413517713494e+08;
K2 = 1.402551671286891e+08;

params = [rho, alpha, eta, beta, sigma, gamma, epsilon, rhom, mu, xi, K1, K2];

%Initial Values
S0=datamatrix(:,1)-xi*datamatrix(:,1);  % initial susceptible bacteria
I0=zeros(6,1);  % initial infected
L0=zeros(6,1);  % initial lysed
M0=xi*datamatrix(:,1); % initial mutated
P0=[0;10^2;10^3;10^4;10^5;10^6]; % initial number of phages
OD0=datamatrix(:,1);    % initial optical density

initialvalues = [S0, I0, M0, P0, L0, OD0]'; % intial value matrix

%% multiplicity of infection (MOIs)

% volume = 1; % 0.2 mL microwell
% MOIs = multOfInfect(S0,P0,theta,volume);

%% numerical solution

m = length(datamatrix); n = height(datamatrix);
% S2 = zeros(m,n);
% I2 = zeros(m,n);
% M2 = zeros(m,n);
% P2 = zeros(m,n);
% L2 = zeros(m,n);
B = zeros(m,n);
y = zeros(m,6,n);
errorForPlot = -1*ones(1,height(datamatrix));
colrs = 1/255*[0 0 255; 160 32 240; 255 0 0; 255 165 0; 0 255 255; 0 0 0]; % blue purple red orange cyan black

% numerical solution and plot of simulated optical density population
for i=1:n
    [t,y(:,:,i)] = ode23s(@(t,y) SIMPL_Model(t,y,params),tspan,initialvalues(:,i));
    % S(:,i) = y(:,1,i);
    % I(:,i) = y(:,2,i);
    % M(:,i) = y(:,3,i);
    % L(:,i) = y(:,4,i);
    % P(:,i) = y(:,5,i);
    B(:,i) = y(:,6,i);
    % errorForPlot(i) = rl2Err(B(:,i),datamatrix(i,:)); %total error for each trial
    plot(tspan,B(:,i), 'color', colrs(i,:), 'LineWidth', 1.5)   %plots "best fit"
    hold on
end

% plot given optical density data over ode solutions
for i=1:n
    scatter(tspan,datamatrix(i,:),'MarkerFaceColor',colrs(i,:),'MarkerEdgeColor',colrs(i,:)) % ,colrs(i,:)) %, 'Marker', 'o'
    hold on
end
legend('No phage','10^2', '10^3', '10^4', '10^5', '10^6', 'Location','northeast')
xlabel('Time (hours)')
xlim([0 19])
ylabel('Bacterial Count (CFU/mL)')

%% plot state vars on separate figures (with finer discretization)

tspanB = 0.5*(linspace(0,length(datamatrix(1,:)),1001));
% m = length(tspanB); n = height(datamatrix);

% numerical solutions with fine discretization with figures for each experiment
for i=1:n
    [t2,y2(:,:,i)] = ode15s(@(t,y2) SIMPL_Model(t,y2,params),tspanB,initialvalues(:,i));
    S2(:,i) = y2(:,1,i);
    I2(:,i) = y2(:,2,i);
    M2(:,i) = y2(:,3,i);
    P2(:,i) = y2(:,4,i);
    L2(:,i) = y2(:,5,i);
    B2(:,i) = y2(:,6,i);
    % errorForPlot(i) = rl2Err(OD2(:,i),datamatrix(i,:)); %total error for each trial
    figure(i+1)
    plot(tspanB,B2(:,i), 'color', colrs(i,:), 'LineWidth', 1.5)   %plots "best fit"
    hold on
end

% plot given optical density data over ode solutions
for i=1:n
    figure(i+1)
    scatter(tspan,datamatrix(i,:),'MarkerFaceColor',colrs(i,:),'MarkerEdgeColor',colrs(i,:)) % ,colrs(i,:)) %, 'Marker', 'o'
    hold on
    % if i ~= 1
    a=max(B2(:,i)); b=max(datamatrix(i,:));
    ylim([0 1.1*max(a,b)])
    xlabel('Time (hours)')
    xlim([0 19])
    ylabel('Bacterial Count (CFU/mL)')
    % end
end

%% plots of each population for each experiment

for i=1:n
    figure(i+n+1) % plots of phage populations for each initial condition
    plot(tspanB, P2(:,i),'color',colrs(3,:), 'LineWidth', 1.5)
    yscale log
    legend('Phage','location','northwest')
    xlabel('Time (hours)')
    xlim([tspanB(1) tspanB(end)])
    ylabel('Phage')
    % if i > 4
    %     set(gca, 'yscale', 'log')
    % else
    % if i ~= 1
    %     ylim([0 1.1*max(max(P2(:,i)))])
    % end
    % end
    figure(i+2*n+1) % plots of bacterial populations for each initial condition
    plot(tspanB, S2(:,i),'color',colrs(1,:), 'LineWidth', 1.5)
    hold on
    plot(tspanB, I2(:,i),'color',colrs(4,:), 'LineWidth', 1.5)
    hold on
    % print(gcf,'foo.png','-dpng','-r300'); 
    plot(tspanB, L2(:,i),'color',colrs(2,:), 'LineWidth', 1.5)
    hold on
    plot(tspanB, M2(:,i),'color',colrs(5,:), 'LineWidth', 1.5)
    legend('Susceptible', 'Infected', 'Lysed','Mutated','location','northwest')
    xlabel('Time (hours)')
    xlim([tspanB(1) tspanB(end)])
    if i==1
        ylim([0 1.1*max(S2(:,i))]);
    else
        ylim([0 1.1*max(M2(:,i))])
    end
    ylabel('Bacterial Count (CFU/mL)')
    % if i == 1
    %     set(gca, 'yscale', 'log')
    % else
    %     ylim([0 1.1*max(max(M(:,i),S(:,i)))])
    % end
    hold off
    % print(gcf,'foo.png','-dpng','-r300') % for high quality images
end

%% plot infected only

% yellows = 1/255*[0 0 0; 249 255 161; 255 240 96; 242 219 0; 240 194 0; 231 163 0]; % black and light to dark yellow
ylwToBlue = 1/255*[254 211 3; 255 245 78; 178 231 130; 143 215 159; 112 196 188; 66 146 185]; % orange, yellow, yellow-green, eton blue, blue-green, blue

figure(3*n+2)
for i=1:n
    plot(tspanB, I2(:,i), 'color', ylwToBlue(i,:), 'LineWidth', 1.5)
    hold on
end

xlabel('Time (hours)')
xlim([tspanB(1) tspanB(end)])
ylabel('Infected Bacterial Count (CFU/mL)')
ylim([0 1.1*max(max(I2))])
legend('Trial 1','Trial 2', 'Trial 3', 'Trial 4', 'Trial 5', 'Trial 6','location','northeast')
hold off

%% phase trajectories

% clear; format LONG

% blue := coe, 0 0 255
% red := phage, 255 0 0
% purple := pfe, 160 32 240

%% phage-free equilibrium

% cond: 0 < ab < 1

colrs = 1/255*[160 32 240; 160 32 240; 160 32 240; 255 0 0; 160 32 240; 255 0 0]; % purple purple purple red purple red

% params
eta=0.25; sigma=0.5; K=1;
a = 1; b = 0.5; c = 2;

% initial conds; pfe pfe pfe axis pfe axis
S0 = [0.9 0.75 1.5 0.125 0.25 0.01];
I0 = [0.01 0.2 0.4 0.01 0.01 0.2];
P0 = [1 2*c c 4 3.5 4];
init = [S0; I0; P0];

tspan = [0 100]; params = [a b c eta sigma K];

figure(3*n+3)
plot3(K,0,0,'o','MarkerFaceColor',colrs(1,:),'MarkerEdgeColor',colrs(1,:),'DisplayName','Equilibrium')
grid on
xlabel('Susceptible','FontSize',14)
ylabel('Infected','FontSize',14)
zlabel('Phage','FontSize',14)
hold on

maxI = zeros(1,6);
for i = 1:6
    [tSol,ySol] = ode23s(@(t,y) SIP_Model(tspan,y,params), tspan, init(:,i));
    plot3(ySol(:,1),ySol(:,2),ySol(:,3),'Color',colrs(i,:),'LineWidth',1.5)
    maxI(i) = max(ySol(:,2));
    hold on
    plot3(ySol(numel(ySol(:,1)),1),ySol(numel(ySol(:,2)),2),ySol(numel(ySol(:,3)),3),'Color',colrs(i,:),'Marker','o','MarkerFaceColor',colrs(i,:),'DisplayName','Equilibrium');
    hold on
end

% set(gca, 'xscale', 'log')
ylim([0 max(maxI)])
zlim([0 max(P0)])
legend('Equilibrium','Location','northeast','FontSize',14)
hold off

%% bacteria-free equilibrium

% cond: ab > ac + 1
% clear;

% blue := coe, 0 0 255
% red := phage, 255 0 0
% purple := pfe, 160 32 240

colrs = 1/255*[255 0 0; 225 0 0; 175 0 0; 125 0 0; 75 0 0; 25 0 0]; % red gradient

% params
eta=0.25; sigma=0.5; K=1;
a=1; b=4; c=2;
sprintf('ab > 1 + ac == %g', a*b > 1 + a*c) % check bfe condition true

% initial conditions
S0 = [0.9 0.75 1.5 0.125 0.25 0.01];
I0 = [0.01 0.2 0.4 0.01 0.01 0.2];
P0 = [1 1.5*c c c/3 3.5 4];
init = [S0; I0; P0];

tspan = [0 100]; params = [a b c eta sigma K];

figure(3*n+4)
maxZ = zeros(1,height(colrs));
for i = 1:height(colrs)
    [tSol,ySol] = ode23s(@(t,y) SIP_Model(t,y,params), tspan, init(:,i));
    
    if i==1
        sEq = ySol(numel(ySol(:,1)),1); iEq = ySol(numel(ySol(:,2)),2); pEq = ySol(numel(ySol(:,3)),3);
        bfeEq = plot3(sEq, iEq, pEq,'o','MarkerFaceColor',colrs(1,:),'MarkerEdgeColor',colrs(1,:),'DisplayName','Equilibria');
        hold on
    end
    
    plot3(ySol(numel(ySol(:,1)),1),ySol(numel(ySol(:,2)),2),ySol(numel(ySol(:,3)),3),'Color',colrs(i,:),'Marker','o','MarkerFaceColor',colrs(i,:),'DisplayName','Equilibrium');
    grid on
    hold on
    plot3(ySol(:,1),ySol(:,2),ySol(:,3),'Color',colrs(i,:),'LineWidth',1.5)
    hold on
    fprintf('i= %g: S= %g, I= %g, P= %g\n',i,ySol(numel(ySol(:,1)),1),ySol(numel(ySol(:,2)),2),ySol(numel(ySol(:,3)),3))
    maxZ(i) = max(ySol(:,3));
end

plot3(0,0,c,'ro')
stabAxis = linspace(c,1.1*max(maxZ),1001); % line of attractors on phage axis
plot3(zeros(1,numel(stabAxis)),zeros(1,numel(stabAxis)),stabAxis, 'r','LineWidth',1.5)
xlabel('Susceptible','FontSize',14)
ylabel('Infected','FontSize',14)
zlabel('Phage','FontSize',14)
zlim([0 1.1*max(maxZ)])
legend(bfeEq,'Location','northeast','FontSize',14)
hold off

%% coexistence equilibrium

% cond: 1 < ab < 1 + ac

% clear; format LONG

colrs = 1/255*[0 0 255; 0 0 255; 0 0 255; 0 0 255; 255 0 0; 255 0 0]; % blue blue blue blue red red

% params
eta=0.25; sigma=0.5; K=1;
a=1; b=2; c=2;
sprintf('1 < ab < 1 + ac == %g', (1 < a*b) && (a*b < 1 + a*c)) % check condition for coe true

% coe coe coe coe phage phage
S0 = [0.9 0.75 1.25 0.25 0.01 0.125];
I0 = [0.01 0.2 0.4 0.01 0.2 0.01];
P0 = [1 2*c c 3.5 4 4];
init = [S0; I0; P0];

% numerical coordinates for coe LAS steady state
sStar = K*(a*c - (a*b - 1))/(a^2*b*c);
iStar = sStar*(a*b-1);
pStar = (a*b-1)/a;

tspan = [0 100]; params = [a b c eta sigma K];

figure(3*n+5)
plot3(sStar,iStar, pStar,'o','MarkerFaceColor','b','MarkerEdgeColor','b')
xlabel('Susceptible','FontSize',14)
ylabel('Infected','FontSize',14)
zlabel('Phage','FontSize',14)
grid on
hold on

% maxI = zeros(1,7);
for i = 1:4
    [tSol,ySol] = ode23s(@(t,y) SIP_Model(tspan,y,params), tspan, init(:,i));
    plot3(ySol(:,1),ySol(:,2),ySol(:,3),'Color',colrs(i,:), 'LineWidth',1.5);
    hold on
end

for i = 5:6
    [tSol,ySol] = ode23s(@(t,y) SIP_Model(tspan,y,params), tspan, init(:,i));
    plot3(ySol(:,1),ySol(:,2),ySol(:,3),'Color',colrs(i,:), 'LineWidth',1.5);
    hold on
    plot3(ySol(numel(ySol(:,1)),1),ySol(numel(ySol(:,2)),2),ySol(numel(ySol(:,3)),3),'Color',colrs(i,:),'Marker','o','MarkerFaceColor',colrs(i,:),'DisplayName','Equilibrium');
    hold on
    % fprintf('i= %g: S= %g, I= %g, P= %g\n',i,ySol(numel(ySol(:,1)),1),ySol(numel(ySol(:,2)),2),ySol(numel(ySol(:,3)),3))
end

% figure(3*n+5)
% zlim([0 1E9])
legend('Equilibrium','location','northeast','FontSize',14)
% set(gca, 'zscale', 'log')
hold off