%% Einfaches und verbessertes Eulerverfahren

tLim = [0,5]; 
h = 0.5; 
y0 = 1; 

function dy = odeFunc(t, y)
    dy = y;
end
[t_ee, y_ee] = EulerEinfach(@odeFunc, tLim, y0, h); 
[t_eb, y_eb] = EulerBesser(@odeFunc, tLim, y0, h); 
[t_3, y_3] = RK3Simpson(@odeFunc, tLim, y0, h); 

[t_45, y_45] = ode45(@odeFunc, tLim, y0); 


% Plot
tt = linspace(tLim(1), tLim(end));
plot(tt, exp(tt)); 
hold on; 
plot(t_ee, y_ee,'o:', 'Linewidth', 2);
plot(t_eb, y_eb,'o:', 'Linewidth', 2);
plot(t_3, y_3,'o:', 'Linewidth', 2);
plot(t_45, y_45,'o:', 'Linewidth', 2);
hold off;
legend('exakt', 'Euler (einfach)', 'Euler (besser)','RK3', 'ode45',...
    'Location', 'Northwest');
title('Num. Loesung der DGL dy/dt = y');
xlabel('t'), ylabel('y(t)'); 

%% Ein System von DGLs erster Ordnung
tLim = [0, pi]; 
y0 = [0; 1];

function dy = f(t, y)
    dy = [y(2); -y(1)];
end

[t, y] = ode45(@f, tLim, y0);
y1 = y(:,1);
y2 = y(:,2);

plot(t,y1, t, y2 );
