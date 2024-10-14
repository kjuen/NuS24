%% Vergleich 2-Punkt mit exakter Ableitung
% Hier wird die 2-Punkt- auf eine bekannte Funktion
% angewandt und mit der exakten Ableitung vergleichen 

% Ist h zu klein, steigt der Fehler aufgrund von Auslöschung an. 

h = 0.5;   % Schrittweite
x = double(0:h:3);
N = length(x); 
y = sin(x+1);   % Bsp-Funktion
dyexakt = cos(x+1);

% Zweipunktformel
k2 = 1:(N-1); 
dynum1 = (y(k2+1) - y(k2))/h;

plot(x,dyexakt, '.-', x(k2), dynum1, '.-', ...
    'Markersize', 10);
legend('Exakt', 'O(h)'); 
title(sprintf('2-Punktformel, h = %.2f', h)); 

%% Wie wählt man die Schrittweite h? 
% Ist h zu klein, steigt der Fehler aufgrund von Auslöschung an. 

% Vergleiche die Ableitung der Funktion sin(x+1) bei x=0 
% mit dem exakten Wert in Abhängigkeit von h.

x = single(0);
dExakt = cos(x+1);
hvec = single(logspace(-10,-1, 200));
fehler2 = zeros(size(hvec), 'like', hvec);
for kk = 1:length(hvec)
    h = hvec(kk);
    dsin2 = (sin(x+1) - sin(x+1-h))/h;
    fehler2(kk) = abs(dExakt - dsin2); 
end
loglog(hvec, fehler2); % , hvec, fehler3, hvec, fehler5); 
% Theoretisch optimalen Wert von h: 
% https://nhigham.com/2020/10/06/what-is-the-complex-step-approximation/
hold on; 
hopt = sqrt(eps('single'));   
xline(hopt); 
hold off; 
xlabel('Schrittweite h'); 
ylabel('Fehler'); 
% title(sprintf('%s: Fehler bei der numerischen Differentiation', ...
%    char(type))); 
title("Single-Precision: Fehler der Differenzen-Formel")
lgd = legend('Num. Fehler', '$\sqrt{eps}$' ,'Interpreter','latex'); 

