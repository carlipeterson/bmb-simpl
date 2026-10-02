% November 2, 2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function dydt = f(t,y,z)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% COVID - 19   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Christina Edholm 

%Parameters
%We are approximating:
% z = [rho,K,alpha,eta,beta,sigma,gamma,epsilon,a,b] 

rho = z(1);       
K1 = z(2);
alpha=z(3);
eta=z(4);
beta=z(5);
sigma=z(6);
gamma=z(7);
epsilon=z(8);


% Initiate DE variables
dydt = zeros(5,1);

% Differential Equations -----------------------
y=reshape(y,[],5);
S = y(:,1);
I = y(:,2);
L = y(:,3);
P = y(:,4);
OD = y(:,5);

% Start DEs------
% dS/dt
dydt(1) = rho*S*(1-((S+I)/K1))-alpha*S*P;
% dI/dt
dydt(2) = alpha*S*P-eta*I;
%dL/dt
dydt(3) = eta*I-gamma*L;
% dP/dt
dydt(4) = eta*I*beta-sigma*(S+I)*P;
%dOD/dt
dydt(5) = rho*S*(1-(S+I)/K1)-(1-epsilon)*eta*I-epsilon*gamma*L;


end