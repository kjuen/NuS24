%% Vergleich numerische Integration, numerische Ableitung

N = 1000;   % Ausloeschung sichtbar ab N = 1000000
a = 1000;  % Amplitude des cos
ra = 0.001; 
x = single(linspace(0, 4*pi, N)); 
h = x(2) - x(1); 
y = single(a* (cos(x) + ra*randn(size(x)))); 
plot(x,y); 
xlabel('x'); ylabel('cos(x)'); 
axis tight;
title('cos(x) ohne / mit Rauschen'); 

%% Numerische Ableitung mit der 2-Punkt-Regel 
k2 = 1:(N-1); 
dy2 = (y(k2+1) - y(k2))/h;

% Numerische Integration mit der Trapezregel
dyint = cumtrapz(x,y); 

%% 
subplot(2,1,1); 
plot(x(k2), -dy2); 
hold on; 
plot(x, a* sin(x), 'Linewidth', 2); 
hold off;
legend('Num Diff', 'Exakt'); 
ylabel('sin(x)'); 
title('Negative Numerische Ableitung von cos(x)'); 
axis tight;
subplot(2,1,2); 
plot(x, dyint, x, a*sin(x));  
legend('Num Int', 'Exakt'); 
xlabel('x'); ylabel('sin(x)'); 
axis tight;
title('Numerisches Integral von cos(x)'); 