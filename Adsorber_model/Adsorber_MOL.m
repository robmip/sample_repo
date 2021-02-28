clc
clear all

tic

%ref to Script with the needed Parameter Values
par_decl

%ref to Script with Euler Steps and net structure
Grid_def

% Anfangswerte der Zeit-, Raumvektoren
    y     =  zeros(nz,nt);
    dydt  =  zeros(nz,nt);
    term_1=  zeros(nz,nt);
    term_2=  zeros(nz,nt);
    term_3=  zeros(nz,nt);
    P     =  ones(nz,1)*P_0;
    z     =  zeros(nz,1);    
    dPdt  =  zeros(nz,nt);
    Zeit  =  zeros(nt,1); 
    D_ax  =  ones(nz,1)*10^(-3);
    dqdt  =  zeros(nz,nt);
    q_avg =  zeros(nz,nt);
    qT_avg=  zeros(nt,1);
    Q_tot =  zeros(nt,1);
    Q_tot2=  zeros(nt,1);
    dydz  =  zeros(nz,nt);
    d2ydz2=  zeros(nz,nt);
    q_ggw =  zeros(nz,nt);%[mmolCO2/grAds]
    
    for j=2:nz
        z(j)=z(j-1) + dz;
    end
    
    for t=2:nt
        Zeit(t)= Zeit(t-1) + h ;
    end
    
%Ergun, Konstant
dPdz      = -(((150*Miu*W_ads)/(Dp^2))*((1-Eb)^2/Eb^3) ...
            +((1.75*Ro_b*W_ads^2)/(Dp))*((1-Eb)/Eb^3));                 
%Nomenklatur: t0->k=1; t1->k=2; ...

%Units for y    = molCO2/Million moles dry air
%Units for dydt = (molCO2/Million moles dry air)*sec^(-1)

for k=2:nt   
    
%Randbedingung (jetzt eingerichtet für den Adsorptionschritt)        
% Eingangsbedingung (z = 0): dqdt = 0 & Dax(d2zdy2)=W_adsP(j))*dydz 
    P(1)      = P_Ein + dPdz*dz ;   
    D_ax(1)   = Dax(T,P(1));    
    q_ggw(1,k)  = q_GGW_3(P(1),y(1,k-1));
    q_avg(1,k)  = q_avg(1,k-1) + dqdt(1,k-1)*h;
    dqdt(1,k)   = dq_dt(q_avg(1,k),q_ggw(1,k));
    dydz(1,k)   = (W_ads/D_ax(1))*(y(1,k-1)-y_0);
    d2ydz2(1,k) = 0;
    term_1(1,k) = - W_ads*dydz(1,k);
    term_2(1,k) = -(R*T/P(1))*Ro_p*((1-Eb)/Eb)*dqdt(1,k)*10^3;
    term_3(1,k) = + D_ax(1)*d2ydz2(1,k);
    dydt(1,k)   = term_1(1,k)+term_2(1,k)+term_3(1,k);            
    for j=2:nz-1 
        P(j)      = P(j-1) + dPdz*dz ;
        D_ax(j)   = Dax(T,P(j));    
        q_ggw(j,k)  = q_GGW_3(P(j),y(j,k-1));
        q_avg(j,k)  = q_avg(j,k-1) + dqdt(j,k-1)*h;
        dqdt(j,k)   = dq_dt(q_avg(j,k),q_ggw(j,k));
        dydz(j,k)   = (y(j,k-1)-y(j-1,k-1))/dz;
        d2ydz2(j,k) = (y(j-1,k-1)-2*y(j,k-1)+y(j+1,k-1))/(dz^2);
        term_1(j,k) = - W_ads*dydz(j,k);
        term_2(j,k) = -(R*T/P(j))*Ro_p*((1-Eb)/Eb)*dqdt(j,k)*10^3;
        term_3(j,k) = + D_ax(j)*d2ydz2(j,k);
        dydt(j,k)   = term_1(j,k)+term_2(j,k)+term_3(j,k);               
    end
    P(nz)     = P(nz-1) + dPdz*dz ;
    D_ax(nz)  = Dax(T,P(nz));        
    q_ggw(nz,k) = q_GGW_3(P(nz),y(nz,k-1));
    q_avg(nz,k) = q_avg(nz,k-1) + dqdt(nz,k-1)*h;
    dqdt(nz,k)  = dq_dt(q_avg(nz,k),q_ggw(nz,k));
    dydz(nz,k)  = 0;
    d2ydz2(nz,k)= 0;
    term_1(nz,k)= - W_ads*dydz(nz,k);
    term_2(nz,k)= -(R*T/P(nz))*Ro_p*((1-Eb)/Eb)*dqdt(nz,k)*10^3;
    term_3(nz,k)= + D_ax(nz)*d2ydz2(nz,k);
    dydt(nz,k)  = term_1(nz,k)+term_2(nz,k)+term_3(nz,k);    

 for j=1:nz % Next Euler step: X_neue = X + dxdt(X_neue)*h                     
    y(j,k)   = y(j,k-1) + dydt(j,k)*h;       
    Q_tot(k) = Q_tot(k) + q_avg(j,k)*dz*A*(1-Eb)*Ro_p; 
    qT_avg(k)= qT_avg(k) + q_avg(j,k);
 end
    qT_avg(k)= qT_avg(k)/nz; 
    Q_tot2(k)= qT_avg(k)*V_tot*(1-Eb)*Ro_p;

end   

toc

%plotting script
Plot_rang