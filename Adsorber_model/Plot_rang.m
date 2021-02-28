% Graphing

figure(1)
plot(subplot(1,1,1),Zeit,Q_tot);
xlabel('Adsorbtionsszeit, s');
ylabel('mol CO_2 ');
title('CO_2 adsorbed (Qtot)');

figure(2)
plot(subplot(5,1,1),z,y(:,2));
xlabel('Betthöhe m');
ylabel('ppm CO_2');
title('Konzentrations Gasphase t=t_2');
plot(subplot(5,1,2),z,y(:,nt/50));
xlabel('Betthöhe m');
ylabel('ppm CO_2');
title('Konzentrations Gasphase t=nt/50');
plot(subplot(5,1,3),z,y(:,nt/10));
xlabel('Betthöhe m');
ylabel('ppm CO_2');
title('Konzentrations Gasphase t=nt/10');
plot(subplot(5,1,4),z,y(:,nt/2));
xlabel('Betthöhe m');
ylabel('ppm CO_2');
title('Konzentrations Gasphase t=nt/2');
plot(subplot(5,1,5),z,y(:,nt));
xlabel('Betthöhe m');
ylabel('ppm CO_2');
title('Konzentrations Gasphase t=tf');

figure(3)
plot(subplot(5,1,1),z,q_avg(:,2));
xlabel('Betthöhe m');
ylabel('mmolCO_2/grAds');
title('Konzentrations Adsorber t=t_2');
plot(subplot(5,1,2),z,q_avg(:,nt/50));
xlabel('Betthöhe m');
ylabel('mmolCO_2/grAds');
title('Konzentrations Adsorber t=tf/50');
plot(subplot(5,1,3),z,q_avg(:,nt/10));
xlabel('Betthöhe m');
ylabel('mmolCO_2/grAds');
title('Konzentrations Adsorber t=tf/10');
plot(subplot(5,1,4),z,q_avg(:,nt/2));
xlabel('Betthöhe m');
ylabel('mmolCO_2/grAds');
title('Konzentrations Adsorber t=tf/2');
plot(subplot(5,1,5),z,q_avg(:,nt));
xlabel('Betthöhe m');
ylabel('mmolCO_2/grAds');
title('Konzentrations Adsorber t=tf');


figure(4)
plot(subplot(1,1,1),z,P);
xlabel('Betthöhe m');
ylabel('Druck Pa');
title('Drucksprofile');