% Parameters   (MKS units)
    PM_N2 = 28;         %kg/kmol
    PM_CO2 = 16*2+12;   %kg/kmol
    Ep = 0.34;          %Porosity particle
    Dp = 0.04;          %particle diameter [m]   
    Rp = Dp/2;          %particle Radius [m]  
    
    D_pore = 0.3*10^(-9);% Pore Diameter [m] (in "Berechnung_Rob_2 nicht" benutz
    Ro_p=700;           % particle density [kg/m3] (in "Berechnung_Rob_2 nicht" benutz
    Ro_g=1.140865826;    % bulkgas density [kg/m3]
    phi = 0.95 ;         % Sphericity "Berechnung_Rob_2 nicht" benutz
    h_tot = 0.6;         % Betthöhe [m]
    D_ad = 6;            % Adsorberbett diameter  
    T = 295;             % Temperature [K]
    R = 8.314;           % Gas constant [J/molK]
    E = 0.38;            % Schütungsporosität
    Eb = 0.59;           % bulk Porosity (empty/whole volume)
    Miu = 18.06E-06;     % [Pa*s] Viscosity N2[kg/(m.s)]
    Miu_CO2 = 15.17E-06; % [Pa*s] Viscosity CO2[kg/(m.s)]
    Ro_b = 660;          % Ro_p*(1-Eb); % [kg/m3] bulk density
    F_feed = 1400*(1/3.6);% Entering Air current[kmol/h]->[mol/s]
    y_0=390;             % ppm conv Faktor to Molenbruch(mol_CO2/10mol_tot)
    P_0=101325;          % initial pressure of the system [Pa]
    P_Ein = 101325*1.18; % Maintained entering air pressure[Pa]
    
%calculated prameters
    A = (3.1416)*(D_ad/2)^2;            % transversal area
    V_tot = h_tot*(D_ad^(2)*3.1416)/4;  % Bettvolume [m3]
    m_ads = Ro_b*V_tot;                 % Adsorber mass [kg]
    W_ads = (F_feed*R*T)/((P_0)*A);     % Superficial velocity [m/s]
    tau = Ep+1.5*(1+Ep);                % Tortuosity [m](Mackie&Meares,1955),(Wakao&Smith,1962)

%Ausgangsparameter
   %y_f = 280;          % ppm conv Faktor to Molenbruch(mol_CO2/mol_tot)=(1/10e3)
    L_z = h_tot;        % lenght from the Adsorberbett [m]