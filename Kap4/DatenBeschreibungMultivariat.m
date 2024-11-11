%% Beschreibung von multivariaten Daten

% Diesmal als table-Datentyp einlesen
tbl = readtable('BrainSizeData.xls');

%% Daten filtern: NaN Werte rauswerfen
naMask = isnan(tbl.Weight);
tbl = tbl(~naMask, :);

FSIQ = tbl.FSIQ;
Weight = 0.454 * tbl.Weight;
Height = 2.54 * tbl.Height;
MRI_Count = tbl.MRI_Count;
clear tbl;


%% Scatterplot der Daten
plot(Height, Weight, 'o'); 
xlabel('Koerpergroesse in cm');
ylabel('Gewicht in kg'); 
title('Brainsize Datensatz'); 




%% Scatterplot der zentrierten Daten
scatter(Height - mean(Height), ...
    Weight-mean(Weight), 'filled');
xlabel('Koerpergroesse in cm');
ylabel('Gewicht in kg'); 
title('Brainsize Datensatz (zentriert)'); 
hold on
xline(0, 'k', 'Linewidth', 0.5);
yline(0, 'k', 'Linewidth', 0.5);
hold off;



%% Kovarianz-Matrix (symm)
% Das Nebendiagonalelement ist die emp. Kovarianz zwischen
% Breite und Hoehe (pos. => Punktewolke steigt)
cov(Height, Weight, 1)
var(Height, 1)   % Erstes Diagonalelement
var(Weight, 1)    % Zweites Diagonalelement


















%% Scatterplot der normierten Daten
hnorm = (Height - mean(Height))/std(Height,1); 
wnorm = (Weight-mean(Weight))/std(Weight,1);
scatter(hnorm, wnorm);
xlabel('Koerpergroesse');
ylabel('Gewicht'); 
title('Brainsize Datensatz (normiert)'); 
hold on
xline(0, 'k', 'Linewidth', 0.5);
yline(0, 'k', 'Linewidth', 0.5);
hold off;





%% Pearson-Correlation
corrcoef(Height, Weight)  % Breite und Hoehe sind positiv korreliert
cov(hnorm, wnorm, 1)   % identisch mit der Zeile davor


%% Korrelationsmatrix des ganzen Datensatzes
corrcoef([Height, Weight, MRI_Count, FSIQ])








%% Zusammenhang zwischen Groesse und IQ
scatter(Height, FSIQ); 
xlabel('Koerpergroesse in cm'); 
ylabel('FSIQ'); 
cc = corrcoef(Height, FSIQ);
title(sprintf('Groesse - IQ: Korrelation: %1.2f', cc(1,2)));




