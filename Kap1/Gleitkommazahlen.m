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
