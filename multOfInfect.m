function MOI = multOfInfect(S0,P0,theta,vol)
%multOfInfect:= Calculates multiplicity of infection (MOI), the ratio
%   of phage to bacteria.
%   Inputs: 
%       S0 <- initial susceptible bacteria
%       P0 <- initial phage
%       theta <- portion of initial bacteria that are mutated
%       vol <- volume of experimental container (mL)
%   Output:
%       MOI <- vector of MOIs

if length(S0) ~= length(P0)
    MOI = -1*ones(1,min(length(S0),length(P0)));
else
    MOI = -1*ones(1,length(S0));
    S0 = S0 - theta*S0;
    for i=1:length(S0)
        MOI(i) = P0(i)/(S0(i)*vol);
    end
end

end