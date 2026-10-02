clear; close all; format LONG

% blue := coe, 0 0 255
% red := phage, 255 0 0
% purple := pfe, 160 32 240

%% phage-free equilibrium

% cond: 0 < ab < 1

colrs = 1/255*[160 32 240; 160 32 240; 160 32 240; 255 0 0; 160 32 240; 255 0 0]; % p p p r p r

eta=0.25;
sigma=0.5;
K=1;

a = 1; b = 0.5; c = 2;

% initial conds; pfe pfe pfe axis pfe axis
S0 = [0.9 0.75 1.5 0.125 0.25 0.01];
I0 = [0.01 0.2 0.4 0.01 0.01 0.2];
P0 = [1 2*c c 4 3.5 4];
init = [S0; I0; P0];

tspan = [0 100]; params = [a b c eta sigma K];

figure(1)
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
clear;

% blue := coe, 0 0 255
% red := phage, 255 0 0
% purple := pfe, 160 32 240

colrs = 1/255*[255 0 0; 225 0 0; 175 0 0; 125 0 0; 75 0 0; 25 0 0]; % red gradient

eta=0.25;
sigma=0.5;
K=1;

a=1; b=4; c=2;
sprintf('ab > 1 + ac == %g', a*b > 1 + a*c)

S0 = [0.9 0.75 1.5 0.125 0.25 0.01];
I0 = [0.01 0.2 0.4 0.01 0.01 0.2];
P0 = [1 1.5*c c c/3 3.5 4];
init = [S0; I0; P0];

tspan = [0 100]; params = [a b c eta sigma K];

figure(2)
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
stabAxis = linspace(c,1.1*max(maxZ),1001);
plot3(zeros(1,numel(stabAxis)),zeros(1,numel(stabAxis)),stabAxis, 'r','LineWidth',1.5)
xlabel('Susceptible','FontSize',14)
ylabel('Infected','FontSize',14)
zlabel('Phage','FontSize',14)
zlim([0 1.1*max(maxZ)])
legend(bfeEq,'Location','northeast','FontSize',14)
hold off

%% coexistence equilibrium

% cond: 1 < ab < 1 + ac

clear; format LONG

colrs = 1/255*[0 0 255; 0 0 255; 0 0 255; 0 0 255; 255 0 0; 255 0 0]; % b b b b r r

eta=0.25;
sigma=0.5;
K=1;

a=1; b=2; c=2;
sprintf('1 < ab < 1 + ac == %g', (1 < a*b) && (a*b < 1 + a*c))

% coe coe coe coe phage phage
S0 = [0.9 0.75 1.25 0.25 0.01 0.125];
I0 = [0.01 0.2 0.4 0.01 0.2 0.01];
P0 = [1 2*c c 3.5 4 4];
init = [S0; I0; P0];

% sStar = K*(sigma*rho - eta*(alpha*beta - sigma))/(alpha*beta*rho);
% iStar = sStar*(alpha*beta - sigma)/sigma;
% pStar = (eta*(alpha*beta-sigma))/(sigma*alpha);

sStar = K*(a*c - (a*b - 1))/(a^2*b*c);
iStar = sStar*(a*b-1);
pStar = (a*b-1)/a;

tspan = [0 100]; params = [a b c eta sigma K];

figure(3)
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

% figure(3)
% zlim([0 1E9])
legend('Equilibrium','location','northeast','FontSize',14)
% set(gca, 'zscale', 'log')