%% Analyse der Airmiles-Daten

% Der Datensatz:
% The revenue passenger miles flown by commercial airlines in the
% United States for each year from 1937 to 1960 (F.A.A. Statistical
% Handbook of Aviation).
load airmiles;

% Abkuerzungen
x = yrs';    % Spaltenvektor
y = airmiles';    % Spaltenvektor
N = length(x);   % Anzahl Datenpunkte
plot(x,y, '.', 'MarkerSize', 18); 
title('Zurueckgelegte Flugmeilen'); 
xlabel('Jahr'), ylabel('Meilen');



%% Anpassen einer konstanten Funktion
beta_0 = mean(y);    % Mittelwert der y-Werte
f_0 = beta_0*ones(size(y));
hold on;
plot(x,f_0); 
hold off;

% Modell-Bewertung: 
SSE_0 = sum((f_0-y).^2)

%% Anpassen einer Ausgleichsgerade:
X_1 = [ones(N,1) x]    % Designmatrix
beta_1 = linsolve(X_1'*X_1, X_1'*y) 
f_1 = X_1*beta_1;   % Modell
hold on; 
plot(x, f_1);
hold off;

% Modelbewertung
SSE_1 = sum((f_1-y).^2)
corrMat = corrcoef(f_1, y)
R2_1 = corrMat(1,2)^2

%% Darstellung der Abweichungen
figure; 
r_1 = y - f_1; 
scatter(x,r_1);
yline(0); 
title('Abweichungen Regressionsgerade'); 


%% Anpassen eines Ausgleichspolynoms 2. Ordnung
% Man achte auf die Warnung: Die Normalengleichungen sind schlecht
% konditioniert. 
X_2 = [ones(N,1) x x.*x];    % Designmatrix
beta_2 = linsolve(X_2'*X_2, X_2'*y);



%% Zentrieren der Daten
% das dient zur Verbesserung der Konditionierung des Problems
xz = x - mean(x);
yz = y - mean(y); 
X_2 = [ones(N,1) xz xz.*xz];    % Designmatrix
beta_2 = linsolve(X_2'*X_2, X_2'*yz); 
% Man beachte: hier muss + mean(y) gerechnet werden, um die Daten zu
% denormieren!
f_2 = @(x) beta_2(1) + beta_2(2)*x + beta_2(3)*x.^2 + mean(y);
hold on; 
plot(x, f_2(xz));
hold off;
legend('Daten', 'Ordn. 0', 'Ordn. 1', 'Ordn. 2', ...
   'Location', 'Northwest'); 

%% Modellbewertung
SSE_2 = sum((f_2(xz)-y).^2)
corrMat = corrcoef(f_2(xz), y);
R2_2 = corrMat(1,2)^2

%% Darstellung der Abweichungen

r_2 = y - f_2(xz); 
hold on; 
scatter(x,r_2);
hold off;


%% Polynom 3. Ordnung
X_3 = [ones(N,1) xz xz.*xz xz.^3];    % Designmatrix
beta_3 = linsolve(X_3'*X_3, X_3'*yz);
f_3 = X_3*beta_3+mean(y);
hold on; 
plot(x, f_3);
hold off;
legend('Daten', 'Ordn. 0', 'Ordn. 1', 'Ordn. 2', ...
   'Location', 'Northwest'); 

% Modellbewertung
SSE_3 = sum((f_3-y).^2)
corrMat = corrcoef(f_3,y); 
R2_3 = corrMat(1,2)^2

%% Fazit: 
% Das Polynom der Ordnung 2 ist das beste Modell
% * es ist deutlich besser als die Regressiongerade
% * Das Polynom 3. Ordnung hat kein besseres R2 und kaum weniger SSE


%% Vorhersage: Meilen im Jahr 1970, 1980
xn = [1970, 1980]; 
yn = f_2(xn-mean(x)) + mean(y);
figure; 
plot(x,y, '.' , ...
    xn, yn, '.r', 'MarkerSize', 18); 

legend('Daten', 'Vorhersage', 'Location', 'Northwest');
