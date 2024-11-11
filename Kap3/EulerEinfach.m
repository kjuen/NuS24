function [t, y] = EulerEinfach(func, tLim, y0, h)
   % EULEREINFACH: Implementierung des einfachen Eulerverfahrens
   % Eingangsargumente: 
   % * func: DGL-Funktion der Signatur doty = func(t,y)
   % * tLim: Vektor der Laenge 2, der das Simulationsintervall angibt.
   % * y0: Anfangswert, d.h. y(t0) = y0 mit t0 = tLim(1)
   % * h: Schrittweite
   % Rueckgabewerte:
   % * t: Diskretisierung der Zeitachse
   % * y: Die zu den diskretisierten Zeiten berechneten Werte der Loesung

   t = tLim(1):h:tLim(2);    % Diskretisierung der Zeitachse
   y= zeros(length(t), 1);        % Initialisierung der Loesung
   y(1) = y0;                
   % Schleife ueber die diskreten Zeitschritte
   for k = 1:(length(t)-1)    
       k1 = func(t(k), y(k));
       y(k+1) = y(k) + h*k1;
   end
end

