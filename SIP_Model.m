function dydt = SIP_Model(t,y,z)
%dydt is the setup of our ODE system
%   Inputs:
%       t <- time
%       y <- values of the state variables
%       z <- parameters
%   Output:
%       dydt <- set of differential equations 

% Parameters
a=z(1); b=z(2); c=z(3); eta=z(4); sigma=z(5); K=z(6);

dydt = zeros(3,1);

% State Vars
S = y(1);
I = y(2);
P = y(3);

% ODEs
dydt(1) = eta*a*(c*S*(1-(S+I)/K) - S*P);
dydt(2) = eta*(a*S*P - I);
dydt(3) = sigma*(b*I - (S+I)*P);

end



