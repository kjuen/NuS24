%% Beschreibung von univariaten Daten
% Als Beispiel werden die BrainSize-Daten genommen. 
% Die wissenschaftliche Arbeit dazu findet man unter 
% https://www.sciencedirect.com/science/article/abs/pii/0160289691900318
% (ueber die HAW-Bibliothek kann man Zugang zu dem Artikel bekommen).
% Hier findet man ein paar Erklärungen zu dem Datensatz: 
% https://www3.nd.edu/~busiforc/handouts/Data and Stories/correlation/Brain Size/brainsize.html

% Gender: Male or Female
% FSIQ: Full Scale IQ scores based on the four Wechsler (1981) subtests
% VIQ: Verbal IQ scores based on the four Wechsler (1981) subtests
% PIQ: Performance IQ scores based on the four Wechsler (1981) subtests
% Weight: body weight in pounds
% Height: height in inches
% MRI_Count: total pixel Count from the 18 MRI scans

mat = readmatrix('BrainSizeData.xls', 'NumHeaderLines', 1); % , 'Range', 'B:G');
% Erste Spalte rausschmeissen
mat = mat(:,2:end);

%% Daten filtern: NaN Werte rauswerfen
naMask = isnan(mat(:,4));
mat = mat(~naMask, :);
any(isnan(mat(:)))

FSIQ = mat(:,1);
Weight = mat(:,4);
Height = mat(:,5);
MRI_Count = mat(:,6);
% clear mat;

%% Auf verstaendliche Einheiten umwechseln
Weight = Weight*0.454;   % pound -> kg
Height = Height*2.54;    % inch -> cm


%% Empirische Haeufigkeitsdichte: Histogramm mit 10 bins

histogram(Height, 10); 
% histogram(Height, floor(min(Height)):ceil(max(Height)));
title('Empirische Haeufigkeitsdichte der Daten'); 
xlabel('Groesse in cm'), ylabel('Haeufigkeit'); 







%% Lageparameter
mean(Height)    % Arithm. Mittel
median(Height)  % median (robust)





%% Streuungsparameter (man achte auf das zweite Argument)
std(Height, 1)  % Standardabweichung
var(Height, 1)  % Varianz
mad(Height, 1)  % MAD (robust)
median(abs(Height - median(Height)), 1)  % auch MAD









%% Empirische Verteilungsfunktion
cdfplot(Height);
title('Empirische Verteilungsfunktion'); 
xlabel('Groesse')







%% Quantile: 
quantile(Height, 0)      % Minimum
quantile(Height, 0.25)   % unteres Quartil
quantile(Height, 0.5)    % Median
quantile(Height, 0.75)   % oberes Quartil
quantile(Height, 1)      % Maximum




%% Boxplot
boxplot(Height);
ylabel('Koerpergroesse');
