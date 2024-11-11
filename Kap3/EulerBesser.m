function [t, y] = EulerBesser(func, tLim, y0, h)
   % EULERBESSER: Implementierung des verbesserten Eulerverfahrens
   % Eingangsargumente: 
   % * func: DGL-Funktion der Signatur doty = func(t,y)
   % * tLim: Vektor der Laenge 2, der das Simulationsintervall angibt.
   % * y0: Anfangswert, d.h. y(t0) = y0 mit t0 = tLim(1)
   % * h: Schrittweite
   % Rueckgabewerte:
   % * t: Diskretisierung der Zeitachse
   % * y: Die zu den diskretisierten Zeiten berechneten Werte der Loesung
 
   t = tLim(1):h:tLim(2); 
   y= zeros(length(t), 1); 
   
   y(1) = y0;
   for k = 1:(length(t)-1)
      k1 = func(t(k), y(k));
      k2 = func(t(k)+h/2, y(k) + h*k1/2);
      y(k+1) = y(k) + h*k2;
   end
end

