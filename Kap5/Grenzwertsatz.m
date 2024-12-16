%% Beispiele fuer den zentralen Grenzwertsatz

%% Wuerfeln mit einem Wuerfel: Gleichverteilung
K = 50000;  % Anzahl Durchfuehrungen des Zufallsexperimentes
wuerfe = randi(6, K, 1); 
histogram(wuerfe); 
muWuerfel = 3.5; 
stdWuerfel = sqrt(35/12); 

%% Wuerfeln mit vielen Wuerfeln und Mittelwert bilden
N = 2;   % Anzahl der Wuerfel
Mittelwerte = zeros(K, 1); 
for kk=1:K
   wuerfe = randi(6, N, 1); 
   Mittelwerte(kk) = mean(wuerfe); 
end
histogram(Mittelwerte) 
% xlim([3, 4]); 

%% Ist das wirklich eine Normalverteilung? 
[F, x] = ecdf(Mittelwerte); 
plot(x, F, x, normcdf(x, muWuerfel, stdWuerfel/sqrt(N))); 
xlabel('Mittelwerte'); ylabel('Verteilungsfkt.'); 
title('Verteilungsfunktion von Daten und Normalverteilung'); 
legend('Simulierte Daten', 'Verteilungsfunktion', 'Location', 'Southeast'); 

fprintf('Std-Abw. Mittelwerte: %.3f\n', std(Mittelwerte)); 
fprintf('Std-Abw. Wuerfe/sqrt(N): %.3f\n', stdWuerfel/sqrt(N)); 
 






%% Wuerfeln mit zwei Wuerfeln: Dreiecksverteilung
K = 50000;  % Anzahl Durchfuehrungen des Zufallsexperimentes
wuerfe = randi(6, K, 2);
augensumme = sum(wuerfe, 2); 
histogram(augensumme); 
muAugensumme = 7; 
E2A = 1/36*(2^2 + 2*3^2 + 3*4^2 + 4*5^2 + 5*6^2 + 6*7^2 + 5*8^2 + 4*9^2 + 3*10^2 + 2 * 11^2 + 12^2); 
stdAugensumme = sqrt(E2A - muAugensumme^2); 


%% Wuerfeln mit vielen Wuerfeln und Mittelwert bilden
N = 30;   % Anzahl der Wuerfelpaare
Mittelwerte = zeros(K, 1); 
for kk=1:K
   wuerfe = randi(6, N, 2); 
   augensumme = sum(wuerfe, 2); 
   Mittelwerte(kk) = mean(augensumme);
end
hist(Mittelwerte, ( N:(12*N))/N); 
xlim([5, 9]); 

%% Ist das wirklich eine Normalverteilung? 
[F, x] = ecdf(Mittelwerte); 
plot(x, F, x, normcdf(x, muAugensumme, stdAugensumme/sqrt(N))); 
xlabel('Mittelwerte'); ylabel('Verteilungsfkt.'); 
title('Verteilungsfunktion von Daten und Normalverteilung'); 
legend('Simulierte Daten', 'Verteilungsfunktion', 'Location', 'Southeast'); 

fprintf('Std-Abw. Mittelwerte: %.3f\n', std(Mittelwerte)); 
fprintf('Std-Abw. Augensumme/sqrt(N): %.3f\n', stdAugensumme/sqrt(N)); 
 
  

   




