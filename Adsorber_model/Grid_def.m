% Grid in axial direction (L=100/nz=21)
    nz=30;
    dz=L_z/nz;    

% Initial, final times
    t0=0.0; 
    tf=60*60*1.5;%60*60;%60*60*1.5;

% Integrationschritt, Anzahl von Eulerschritte
    h=0.005; 
    nt=(tf-t0)/h;
    z(1) = 0;     