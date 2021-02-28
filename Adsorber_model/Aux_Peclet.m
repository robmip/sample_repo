
% Auxiliar ccalculation of the Peclet number
P = 111000;
%ref to Script with the needed variables
var_decl

%berechnung muss überpruft werden, was heißt Dv eigentlich?("sogennante
%Diffusion Volume")
%dafür wurde IGas gesetz angewandt
% Imaginary werte werden hier verursacht, Anppassung arfordet
% Dv_N2 = R*T*(1/101000);       %(1-y)/P;  
% Dv_CO2 = R*T*(0.0003/101000);  % y/P;    da y~0 und P~101000 Pa konst.
Dv_N2 = 0;
Dv_CO2 =29.6;
%change
%Von Solano 2016, bzw. Fuller, 1966.
D_i_j = (0.001*T^(1.75)*((PM_N2+PM_CO2)/(PM_N2*PM_CO2)))/((P*(Dv_N2^(1/3)+Dv_CO2^(1/3)))^2);

Re = (W_ads*D_ad*Ro_g)*Miu;% Reynolds %1.449e-5
Sc = Miu /(Ro_g*D_i_j);% Schmidt
Pe = 2*(Re*Sc)/(40+Re*Sc)
F_feed_lim = (P_0*A)/(R*T)

% Add the calculated Pe to the Dax script
