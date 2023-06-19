x = rand(10, 1);
y = rand(10, 1);

%x = [0; 1; 2; 2.5];
%exact points
%y = [0.7; 3.2; 5.7; 6.95];

%with noise
%y = [0.65; 3.1; 5.95; 7];

figure;

for n = 1 : length(x)
    alpha = polynomial_regression(x, y, n);
    
    x_plot = linspace(min(x), max(x), 10000);
    y_plot = polyval(alpha, x_plot);
    
    clf;

    annotation('textbox', [0.2, 0.8, 0.1, 0.1], 'String', "" + (n-1) + " degree");

    plot(x, y, 'or');
    hold on;
    
    plot(x_plot, y_plot, 'b');
    
    waitforbuttonpress;
end
