%% Vektoren und Graphik

x = 3;
fprintf('Meine Variable x = %.3f\n', x);

%% Datentypen
% Datentypen müssen in Matlab nicht deklariert werden wie in C, sondern
% werden dynamisch zugewiesen. C hat ein statisches Typsystem, Matlab ein
% dynamisches. 

a = 23.5;   
b = 19; 
c = single(pi); 
d = sqrt(-5); 


%% Zeilenvektoren
% Matlab unterscheidet zwischen Zeilen- und Spaltenvektoren !!
% Die einfachste Methode zur Definition von Vektoren ist die explizite
% Auflistung der Elemente:

zv1 = [3 1 2];  
zv2 = [3, 1, 2]  % dasselbe wie zv1



%% Spaltenvektoren
% Bei Spaltenvektoren werden die Elemente durch ein Semikolon getrennt:
sv1 = [3; 2; 1]



%% Transponieren
% Durch Transponieren werden Zeilen- und Spaltenvektoren ineinander verwandelt:
zv1'
sv1'
sv1''  % = sv1

%% Der : Operator - Vektoren mit konstantem Inkrement
% Explizites Auflisten der Elemente ist oft nicht praktikabel. Der |:|
% Operator erlaubt, beliebig lange Zeilenvektoren mit konstantem Inkrement sehr
% einfach zu definieren: 

zv1 = 0:2:8   % Anfang = 0, Inkrement = 2, Ende = 8
zv2 = 0:-2:-8   % negatives Inkrement
zv3 = 1:1000;     % Standard Inkrement 1

%% 
% Die Anzahl der Elemente eines Vektors bestimmt man mit der Funktion
% |length|: 
length(zv3)
size(zv3)  % 'Matrix'-Größe des Vektors

%% Die linspace Funktion - Vektoren mit vorgegebener Anzahl Elemente
% Die Funktion |linspace| funktioniert so aehnlich und erzeugt eine
% vorgegebene Anzahl von aequidistanten Elementen. 

linspace(0, 10)  % 5 aequidistante Zahlen zwischen 0 und 10


%% Vektorisierter Funktionsaufruf
% Mit einem vektoriellen Argument iterieren viele Funktionen automatisch 
% ueber die Elemente und geben wiederum einen Vektor zurück!
x = linspace(0, 6*pi, 3);   
sx = sin(x);

%% Ein einfacher Funktions-plot
% Graphik-Funktionalitaet wird spaeter noch ausfuehrlich behandelt. Das hier
% ist nur ein Vorgeschmack.
plot(x, sx);  





%% Skalarprodukt
% Skalarprodukt = Zeilenvektor * Spaltenvektor. Alles andere ergibt einen
% Fehler. 
v1 = 1:3 
s = v1 * v1';




%% Elementweise Operationen
% + und - sind sinnvollerweise nur elementweise definiert.
% Die Vergleichsoperatoren funktionieren ebenfalls elementweise.
v=1:5;
v + v
v > 3    % produziert einen logischen Vektor

%% 
% Elementweises *, / und ^ wird durch einen Punkt gekennzeichnet!
v = 1:3; 
v .* v 
v .^ v
v ./ v
% v .+ v
%% Vektoren und Skalare
% Multiplikation |Skalar * Vektor| ist aus der Mathematik bekannt
% Die Addition |Vektor + Skalar| wird elementweise durchgefuehrt: 

v = 1:5; 
2 * v
v + 2


%% Einige nuetzliche skalare Funktionen fuer Vektoren: 
% Diese Funktionen geben skalare Werte zurueck:
zv = 3:8; 
sum(zv)   
mean(zv)
max(zv)

%% 
% Viele weitere Funktionen dieser Art liefert die Hilfe: 
help datafun








%% Indexzugriff (lesend)

v = 10:20; 
v(1)    % erstes Element
v(11)   % letztes Element
v(end)  % == v(11)
v(end-1)  % vorletztes Element



%% Indexzugriff kann vektorisiert erfolgen
v(1:3)   % Die ersten 3 Elemente
v([2,4,6])  % Elemente mit Indizes 2,4,6



%% Indexzugriff (schreibend)
% Wenn man in noch nicht existierende Elemente reinschreibt, 
% wird automatisch Speicher angelegt und Elemente mit 0 aufgefuellt
v = [];   % leerer Vektor
v(13) = 24



%% Kontrollstrukturen
v = 1:5; 
for k=v
   disp('Im loop'); 
   disp(k); 
end



%% if
x = rand(1)
if x < 0.5
    disp('x< 0.5');
elseif x<0.8
    disp('0.5 <= x < 0.8');
else
    disp('x>=0.5');
end

% while, break, continue wie in C



%% Graphik-Grundlagen
% Hier werden die wichtigsten Graphik-Funktionalitaeten vorgestellt.

%% Daten zum plotten
x = linspace(0,10, 25); 
f = exp(x/3); 
g = x.^2; 

%% Einfacher Plot 
% Das dritte Argument der |plot| Funktion spezifiziert die Plotsymbole. Der 
% erste Buchstabe codiert die Farbe, der zweite das Symbol, das am Datenpunkt 
% gezeichnet wird und der dritte die Verbindungslinie zwischen den
% Datenpunkten. Siehe |doc linespec| fuer mehr Info.


plot(x,f, ':g*');  % x-y-plot, Rote, gepunktete Linie mit o als Marker
% Titel des plots
title('Die Funktion f(x) = exp(x/3)');
% Achsenbeschriftung:
xlabel('x');
ylabel('f(x)');
% Raster einschalten:
grid on;

%% Weitere Daten zum Plot hinzufuegen:
% Ein plot Aufruf alleine erzeugt ein neues Graphik Fenster. Dies
% kann unterbunden werden mit dem |hold| Befehl: 

hold on % ins selbe Fenster plotten
plot(x,g, '--r', 'LineWidth',2.5);  % viele Eigenschaften lassen sich als key-value-Paar ergaenzen
% Legende malen: 
legend('Hallo', 'g(x)', 'Location', 'NorthEast');
hold off; % ab hier wird nicht mehr in unser Fenster geplottet  
% x-Bereich eingrenzen (ylim gibt's auch):
xlim([5, 10]); 
ylim([40, 60]); 

%% Mehrere Plot anordnen
% Mehrere Plots lassen sich systematisch mit dem |tiledLayout| Befehl anordnen.
% Die ersten beiden Argumente geben die Groesse der Anordnungsmatrix an, der
% dritte indiziert den gerade aktiven Plot.

t = tiledlayout(2,2, 'TileSpacing','compact', 'Padding', 'compact');
nexttile;
loglog(x, g); % das gleiche wie plot(log(x), log(g));
xlim([0, log(x(end))]);
title('g(x): Doppelt logarithmisch');

nexttile; 
semilogy(x, f); 
xlim([1, 10]); 
title('f(x): Einfach logarithmisch');
grid on; 

% Ueberschrift fuer das gesamte Fenster 
title(t, 'Die Funktionen f und g'); 
%% Ups grid in plot 1 vergessen
nexttile(1); % tile 1 aktivieren
grid on; 


%% Definition von Funktionen
% Pro Funktion eine Datei mit gleichem Namen
% Die Funktion muss im aktuellen Verzeichnis oder im Pfad sein 
% Beispiel: meineSumme.m

meineSumme(2,4)  

%% Definition von lokalen Funktionen 
% Seit Release 2024a: man kann Funktionen auch innerhalb eines Skripts 
% erstellen. Aber dann kann die Funktion nur innerhalb des Skripts aufgerufen werden

function y = kehrwert(x)
    y = 1./x;
end
kehrwert(2)   % kann auch von der Kommandozeile ausgeführt werden

%% 
x = 1:1000;