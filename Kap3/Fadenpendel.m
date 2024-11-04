%% Das Fadenpendel als Haertetest fuer ODE-Solver

phi0 = 0.1*pi; % Anfangswinkel
tLim = [0, 150]; 

function dx = odeFunc(t, x) 
    g = 1; 
    l = 1;
    dx = [x(2); -g/l*sin(x(1))]; 
end
[t, x] = ode45(@odeFunc, tLim, [phi0;0], ...
   odeset('RelTol', 1e-3)); 
phi = x(:,1); 
plot(t, phi); 
title('Fadenpendel'); 
xlabel('Zeit t'), ylabel('Winkel phi'); 
grid on; 