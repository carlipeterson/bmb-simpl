DRIVER.m - run this file for parameter estimation.

driver_figs.m - this file generates Figure 4 in our paper which shows the simulated data compared to the observed data.

linODtoCFU.m - this file converts OD data to CFU data using a linear function.

multOfInfect.m - this file is used to derive the data in Table 1 of our paper.

newSIMPL_MultiStart.m - this is called by the "DRIVER.m" file and is used to solve the parameter estimation problem.

rl2Err.m - this is called by the "DRIVER.m" file and is used to calculate the relative l^2 error.

histograms.m - this file is used to generate Figure 6 in our paper which shows histograms of the spread of parameters which gave an l^2 error of less than 10%.

phaseRunner.m - this file is used to generate Figure 3 in our paper which depicts phase portraits of our system under different equilibrium conditions.

SIMPL_RUN_ODE15.m - this is called by the "DRIVER.m" file; the ODE solver used to solve the SIMPL ODE system.

SIMPL_Model.m - this is called by the "DRIVER.m" file and is the ODE system.
