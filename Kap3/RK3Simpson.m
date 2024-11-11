function [t, y] = RK3Simpson(func, tLim, y0, h)
   % RK3Simpson: Implementierung des Simpson-basierten
   % Runge-Kutta-Verfahrens dritter Ordnung.
   % Eingangsargumente: 
   % * func: DGL-Funktion der Signatur doty = func(t,y)
   % * tLim: Vektor der Laenge 2, der das Simulationsintervall angibt.
   % * y0: Anfangswert, d.h. y(t0) = y0 mit t0 = tLim(1)
   % * h: Schrittweite
   % Rueckgabewerte:
   % * t: Diskretisierung der Zeitachse
   % * y: Die zu den diskretisierten Zeiten berechneten Werte der Loesung.
   %      MxN Matrix, wobei M = length(t) und N=length(y0) die Anzahl der
   %      Variablen ist.

   nVars = length(y0); 
   t = tLim(1):h:tLim(2); 
   y= zeros(length(t), nVars); 
   y(1,:) = y0';
   for k = 1:(length(y)-1)
      k1 = func(t(k), y(k,:)'); 
      k2 = func(t(k)+h/2, y(k,:)' + h*k1/2);
      k3 = func(t(k)+h, y(k,:)' -h*k1+2*h*k2);
      % disp(y(k,:) -h*k1+2*h*k2);
      %disp([k1, k2, k3]); 
      y(k+1,:) = y(k,:) + h/6*(k1 + 4*k2 + k3)';
   end
end








