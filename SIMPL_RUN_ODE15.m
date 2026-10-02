%This is the function which sets up the ODE problem and also what we are minimizing

function value=SIMPL_RUN_ODE15(z,datamatrix,new_initialvalues,tspan,w,nu)
%options=odeset('RelTol',1e-5,'AbsTol',1e-7);
%Run the ode15s solver on loop 7 times to update matrices S,I,M,L,P, and OD
for i=1:6
    %for j=1:36
        [t,y(:,:,i)] = ode15s(@(t,y) SIMPL_Model(t,y,z),tspan,new_initialvalues(:,i));
        % S(j,i) = y(length(t),1,i);
        % I(j,i) = y(length(t),2,i);
        % M(j,i) = y(length(t),3,i);
        % L(j,i) = y(length(t),4,i);
        % P(j,i) = y(length(t),5,i);
        % OD(j,i)= y(length(t),6,i);
        S(:,i) = y(:,1,i);
        I(:,i) = y(:,2,i);
        M(:,i) = y(:,3,i);
        P(:,i) = y(:,4,i);
        L(:,i) = y(:,5,i);
        OD(:,i)= y(:,6,i);
        %clear t; clear y;
    %end
    size(OD);
size(datamatrix);
end
%Difference Data and Model
% diff = expected optical density vs actual optical density observed
diff = OD - datamatrix';
value = w*0.5*sum(sum((diff).^2)) + nu*0.5*sum(z.^2);
% EP = sqrt(sum(sum((diff).^2))/sum(sum((datamatrix').^2)));
end