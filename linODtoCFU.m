function cfuData = linODtoCFU(data)
% linODtoCFU Converts Optical Density to Colony Forming Units
%   This function converts Optical Density (OD) to Colony Forming Units
%       (CFU/mL) using a linear function found by Kim (2012) 
%   Inputs:
%       data <- OD data matrix with each column representing trials and 
%               rows representing half-hour intervals (rows and cols can be
%               swapped)
%   Output:
%       cfuData <- data matrix with each entry representing approximate 
%                  bacterial cells (CFU/mL)

cfuData = 2e8*data + 4e6;

end