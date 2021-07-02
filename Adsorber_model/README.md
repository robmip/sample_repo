# CO2 Adsorbtion Simulation
This Matlab code is a numerical simulation for a ''Direct Carbon Capture'' process. It is a dynamic simulation with just one spatial coordinate (high of the adsorber bett) considered.

A simple euler method was implemented to solve the partial differential equation problem, which originates (as the theory mentioned) a high dependency between the stability of the results and the size of the step selected (see 'Grid_def' file).

The results, expressed as figures shown under the directory 'Results', take around one hour to be obained (under the selected boundary conditions, step size and processing capability)

## ''The role of each file is described as follows''

## Adsorber_MOL
General routine, where the equation system is laid and the subroutines called.

## Aux_Peclet
auxiliary calculation of a pseudo Peclet Number to reduce computation burden and prevent crashing events.

## Dax
Calculation of the diffusion coefficicent

## dq_dt
calculation of the change in time of the 'specific' molar saturation of the bed.

## Grid_def
definition of the bed size, running time and step sizes.

## par_decl
Declaration/Assignation of the values for the invariant process parameters

## Plot_rang
Plotting code

## q_GGW_3
Definition of the equilibrium function between gas phase partial pressure (of CO2) and 'specific' molar saturation of the adsorber.