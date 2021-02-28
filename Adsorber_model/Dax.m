function [Dax] = Dax(T,P)

%ref to Script with the needed Parameter Values
par_decl

%von Riesenbeck 2014.
Dv_N2 = 0;
Dv_CO2 =29.6;

%von Solano 2016, bzw. Fuller, 1966.
D_i_j = (0.001*T^(1.75)*((PM_N2+PM_CO2)/(PM_N2*PM_CO2)))/((P*(Dv_N2^(1/3)+Dv_CO2^(1/3)))^2);

Re = (W_ads*D_ad*Ro_g)*Miu;% Reynolds 
Sc = Miu /(Ro_g*D_i_j);% Schmidt
Pe = 2*(Re*Sc)/(40+Re*Sc);%Peclet

Dax = (Dp* W_ads)*Pe; 