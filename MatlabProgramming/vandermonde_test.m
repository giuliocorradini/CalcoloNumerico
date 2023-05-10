x = rand(5,1);
y = rand(5,1);

figure;
plot(x, y, 'or');   % plot as red rings (o's)

V = vandermonde(x);

alpha = linsolve(V, y);

% La funzione polyval di matlab permette di costruire un polinomio passando i coefficienti delle
% x, con il primo elemento che corrisponde al coefficiente della x di grado massimo.

alpha = alpha(length(alpha) : -1 : 1); % riordinato al contrario

% per plottare il polinomio devo stampare molti punti, e quindi devo avere un vettore molto più fine.
% voglio dei punti equispaziati

x_plot = linspace(0, 1, 10000);
y_plot = polyval(alpha, x_plot);

hold on % attiva la sovrascrittura del canvas della figura

plot(x_plot, y_plot);
