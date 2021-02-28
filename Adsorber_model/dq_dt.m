function [dqdt] = dq_dt(q_avg,q_ggw)

%ref to Script with the needed Parameter Values
par_decl

% LDF-Ansatz:
%"difference of concentration between the uptake of the sorbate at 
%equilibrium and its average uptake"(Molano, 2017)

%Simplifications:
%dq*/dt = dq/dt
%"Für Systeme, deren Selektivität stark von Gleichgewichtsunterschieden 
%zwischen den Komponenten abhängen, kann das Gleichgewichtsmodell eine 
%ausreichend gute Lösung bieten" (Riesenbeck 2014, Seite 83) 
%Adsorption from N2 neglected)

Dk    = (48.5*D_pore*(T/PM_CO2)^(0.5));

% at low pressure ranges and when the pore diameter
% is small, the probability of particle collision with the pore walls is higher
% and may influence the transport velocity. Under the approximation of
% cylindrical pores and gas ideal behaviour, such effects can be described in
% the Knudsen-Diffusion Coefficient (in m2/s)

D_eff = Dk;

k=15*D_eff/((Rp*phi)^2);%[m2/s]*[m]^-2= [s]^-1

dqdt = k*(q_ggw-q_avg);
