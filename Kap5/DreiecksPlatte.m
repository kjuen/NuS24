%% Simulation Tropfen auf dreieckige Platte

K = 2000;    % Anz. Durchführung des Experiments
xy = zeros(K,2); 
kk = 1; 
while kk<=K
   t = rand(1,2);
   if t(1) > t(2)
      xy(kk,:) = t; 
      kk = 1 + kk;
   end
end
%
subplot(2,2,1);
plot(xy(:,1), xy(:,2), '.');
title('Tropfen auf der Platte'); 
xlabel('x'), ylabel('y'); 
subplot(2,2,2);
histogram(xy(:,2), 30); 
title('Abs. Haeufigkeit der y-Koord.'); xlabel('y'); 
subplot(2,2,3:4);
cdfplot(xy(:,2)); % xlabel('y'); 
hold on; 
yy = linspace(0, 1, 20); 
plot(yy, 2*yy - yy.^2, 'x');
hold off; 
legend('Empirisch', 'Theoretisch', 'Location','nw');
title('Emp. Verteilungsfkt.'); 
fprintf('Mittelwert: %.3f\n', mean(xy(:,2))); 
fprintf('Std (Stichprobe): %.3f\n', std(xy(:,2))); 
fprintf('Std (theo): %.3f\n', 1/sqrt(18));


%% Zentraler Grenzwertsatz

K = 20000;   % Anzahl Durchfuehrung des Exp. mit N Platten
N = 30;   % Anzahl Holzplatten
mY = zeros(K,1); 
kk = 1; 
while kk<=K
   nn=1;
   y = zeros(N,1); 
   while nn<=N
      t = rand(1,2);
      if t(1) > t(2)
         y(nn) = t(2);
         nn = 1 + nn;
      end
   end
   mY(kk) = mean(y); 
   kk=1+kk;
end

subplot(2,1,1); 
histogram(mY); 
subplot(2,1,2); 
[F, x] = ecdf(mY); 
plot(x, F, x, normcdf(x, 1/3, 1/sqrt(18*N))); 
xlabel('Mittelwerte'); ylabel('Verteilungsfkt.'); 
title('Verteilungsfunktion von Daten und Normalverteilung'); 
legend('Simulierte Daten', 'Verteilungsfunktion', 'Location', 'Southeast'); 

fprintf('Std-Abw. Mittelwerte: %.3f\n', std(mY)); 
fprintf('Std-Abw. Y / sqrt(N): %.3f\n', 1/sqrt(18*N)); 
 
  


