%% Lineare Ausgleichsrechnung: Einfaches Beispiel

%% LGS lösen
A = rand(2000); 
b = rand(2000,1); 
tic, r1 = A\b; toc 
tic, r2 = linsolve(A,b); toc 
tic, r3 = inv(A) * b; toc     % SO NICHT !!!


%% Spielzeugdaten (1): 
x = [1 2 2 3]';
y=[0 0 1 1]';
scatter(x,y,'Linewidth', 2); 
% axis([0.9 3.1 -0.1 1.1]); 

%%

X = [ones(size(x)), x];
beta = X'*X \ X'*y
beta2 = polyfit(x,y,1)
hold on; 
xx = linspace(0, 4);
plot(xx, beta(1) + beta(2)*xx);
hold off; 
xlim([xx(1), xx(end)]);



%% Spielzeugdaten (2): 
x = [1/2 1 2]';
y= [3 1 1]';
scatter(x,y,'Linewidth', 2); 
axis([0, 2.5, 0, 3.5]); 
X = [ones(size(x)), 1./x];
beta = linsolve(X'*X, X'*y) 





















