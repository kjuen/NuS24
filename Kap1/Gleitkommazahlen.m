%% Gleitkommazahlen


%% double Datentyp: charakteristische Groessen
eps              % 1 + eps ist die kleinste Zahl > 1
2^(-52)          % sollte mit eps uebereinstimmen

realmin          % kleinste postive darstellbare Zahl
2^(-1022)        % sollte mit realmin uebereinstimmen

realmax          % groesste darstellbare Zahl
(2-eps) * 2^1023 % sollte mit realmax uebereinstimmen

%% single Datentyp: charakteristische Groessen
eps('single')     % 1 + eps ist die kleinste Zahl > 1
2^(-23)           % sollte mit eps uebereinstimmen

realmin('single') % kleinste postive darstellbare Zahl
2^(-126)          % sollte mit realmin uebereinstimmen

realmax('single')          % groesste darstellbare Zahl
(2-eps('single')) * 2^127  % sollte mit realmax uebereinstimmen













%% Rundung in der Naehe der 1
(1 + 0.51*eps) == 1   

(1 + 0.49*eps) == 1 


(1 - 0.49*eps) == 1   
(1 - 0.49*eps/2) == 1 




%% Rundung in der Naehe von realmax
xmax = realmax();
1.001 * xmax    % Inf,
abst = 2^1023 * eps;     % immer noch eine sehr grosse Zahl
(xmax - abst/4) == xmax   % true, es wird aufgerundet
(xmax - 3*abst/4) == xmax % false, es wird abgerundet





%% Ausloeschung
a = 2^60; 
b = 2^60+129;
disp(b-a)




%% Addition nicht assoziativ aufgrund von Rundungsfehlern
klein = 0.000000000123456789;
gross1 = 123456789;
gross2 = - gross1;

k1 = (gross1 + gross2) + klein
k1 == klein                         % true!

k2 = gross1 + (gross2 + klein)
k2 == klein             % false, da klein weggerundet wird!


%% Vergleich von doubles ist gefaehrlich !
% Man weiss in der Regel nicht genau, wann Rundungsfehler auftreten.
% Daher: Niemals single oder double Typen mit == auf Gleichheit pruefen!

4 * 2.5 - 10      % exakt 0, kein Rundungsfehler
(4 * 2.5) == 10   % true


a = 0.3/0.1;
if a ~= 3  % a==3
    disp('Das hier sollte nicht ausgefuehrt werden!!'); 
end





TOL = 0.000001;
if abs(0.3 / 0.1 - 3) < TOL
    disp('gut');
else
    disp('schlecht');
end


%% Ausloeschung bei Wurzelfunktion
x = single(1000000); 
s1 = sqrt(x+1) - sqrt(x); 
s2 = 1/(sqrt(x+1) + sqrt(x));
errSingle = abs((s1-s2)/s1)


%% 
x = double(1000000); 
d1 = sqrt(x+1) - sqrt(x); 
d2 = 1/(sqrt(x+1) + sqrt(x));
errDouble = abs((d1-d2)/d1)




%% 
x = half(10000)
h1 = sqrt(x+1) - sqrt(x); 
h2 = 1/(sqrt(x+1) + sqrt(x));

%% Reihenfolge der Addition
% Berechnung der Reihe von pi^2/6. Es ist besser, zuerst die kleinen Zahlen
% zu addieren, denn sonst werden die kleinen Zahlen von den grossen
% verschluckt.
% (hier wird mit single gerechnet, um den Effekt deutlicher zu machen).

N = single(10^6);           % Summationsgrenze
% Summation 'von vorne': zuerst die grossen Zahlen
k1 = 1:N;
a1 = sum(k1.^(-2));
pi^2/6 - a1          % schlecht: grosser Fehler

% Summation 'von hinten': zuerst die kleinen Zahlen
k2 = N:-1:1;
a2 = sum(k2.^(-2));
pi^2/6 - a2          % deutlich besser





%% Quadratische Gleichung
p = single(1000);
q = 1;
xplus = -p/2 + sqrt(p^2/4 -  q);
xminus = -p/2 - sqrt(p^2/4 -  q);
r = roots([1,p,q]); 
Frel1 = (r(1) - xminus)/r(1);
Frel2 = (r(2) - xplus)/r(2);
















%% Ausloeschung: plot von (x-1)^7
% In der ausmultiplizierten Variante hat man hohe Potenzen in x
% mit verschiedenen Vorzeichen. Die Summenbildung wird ungenau
% aufgrund von Ausloeschung
x = 0.988:.0001:1.012;   % Plot-Bereich in der Naehe von 1
y1 = (x-1).^7;
y2 = x.^7 -7*x.^6 +21*x.^5 -35*x.^4 +35*x.^3 -21*x.^2 +7*x -1;    % ausmultipliziert
plot(x,y1,'LineWidth', 2)
hold on, plot(x,y2, 'r', 'LineWidth', 1.5), hold off;
title('Schaubild von (x-1)^7', 'Fontsize', 14);
legend('(x-1)^7', 'Ausmultipliziert', ...
   'Location', 'Northwest')




x = linspace(0,0.0001);
y = (1-cos(x))./x.^2;
plot(x,y)








%% plot von (x-1)^7 mit numerisch besserer Polynomauswertung
x = 0.988:.0001:1.012;   % Plot-Bereich in der Naehe von 1
y1 = (x-1).^7;
y2 = x.^7 -7*x.^6 +21*x.^5 -35*x.^4 +35*x.^3 -21*x.^2 +7*x -1;    % ausmultipliziert
p = [1 -7 21 -35 +35 -21 +7 -1]
y3 = polyval(p, x);    % benutzt verschachtelte Polynomauswertung
plot(x,y1,'LineWidth', 2)
hold on, plot(x,y2, 'r', 'LineWidth', 1.5), hold off;
hold on, plot(x,y3, 'g', 'LineWidth', 1.5), hold off;
title('Schaubild von (x-1)^7', 'Fontsize', 14);
legend('(x-1)^7', 'Naiv ausmultipliziert', 'polyval', ...
   'Location', 'Northwest')



%% Fehlerfortpflanzung
if sin(pi) ~= 0
   disp('Offensichtlich ist sin(pi) ungleich 0');
end





if abs(sin(pi))<TOL
   fprintf('Bis auf die Toleranz %.8f ist sin(pi) doch 0!\n', ...
      TOL);
end






