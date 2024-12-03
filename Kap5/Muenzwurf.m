%% Muenzwurf

% Laden der Daten
load mw;
Nm = length(mw)
mw(1:10)


%% Relative Haeufigkeit der 1 nach k Wuerfen:
N = Nm;
relHaeuf1 = size(N,1);    % Vektor mit rel. Hauefigkeit der 1
for k = 1:N
   relHaeuf1(k) = sum(mw(1:k))/k; 
end

plot(1:N, relHaeuf1, '.'); 
xlabel('k: Anzahl Muenzwuerfe'); 
ylabel('rel. Haeufigkeit'); 
title('Relative Haefigkeit der 1 nach k Wuerfen'); 
