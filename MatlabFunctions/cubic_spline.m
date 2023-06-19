x = rand(10, 1);
y = rand(10, 1);

x_plot = linspace(min(x), max(x), 10000);
y_plot = spline(x, y, x_plot);

figure;

plot(x, y, 'or');
hold on;

plot(x_plot, y_plot, 'b');
