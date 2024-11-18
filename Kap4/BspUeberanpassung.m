%% Regression und Overfitting
t = (0:0.4:2)';
y = [-1.8616; 1.5265; -1.1116; 0.93208; 1.0236; 3.4886]; 
D =[ones(size(t)), t];
beta = linsolve(D'*D, D'*y);
plot(t, y, 'o', t, D*beta, 'Linewidth', 2); 
xlabel('Zeit t'), ylabel('Messwerte'); 
title('Sinn und Unsinn von Regressionsmodellen'); 
%% Vorhersage bei t=3; 
y3 = beta(1) + beta(2) * 3; 
hold on; 
plot([0,3], [beta(1), y3], 3,y3, 'r^'); 
hold off;
xlim([0, 3.5]);

%% Regression mit Polynom 5. Ordnung
tt = linspace(0,3)'; 
D = [ones(size(t)), t, t.^2, t.^3, t.^4, t.^5];
Dtt = [ones(size(tt)), tt, tt.^2, tt.^3, tt.^4, tt.^5];
beta5 = linsolve(D'*D, D'*y);
hold on; 
plot(t, y, 'o', tt, Dtt*beta5, ...
  tt(end), Dtt(end,:)*beta5, 'v');
hold off;
ylim([-5,10]); 
