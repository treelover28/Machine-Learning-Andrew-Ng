%Plot training data and fit
m = size(X_poly_test,1);
figure(1);
plot(Xtest, ytest, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
plotFit(min(X), max(X), mu, sigma, theta, p);
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
title (sprintf('Polynomial Regression Fit (lambda = %f)', lambda));

figure(2);
[error_test, error_train] = ...
    learningCurve(X_poly_test, ytest, X_poly, y, lambda);
plot(1:m, error_test, 1:m, error_train);

title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', lambda));
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 100])
legend('Test', 'Train')

fprintf('Polynomial Regression (lambda = %f)\n\n', lambda);
fprintf('# Testing Examples\tTest Error\tCross Validation Error\n');
for i = 1:m
    fprintf('  \t%d\t\t%f\t%f\n', i, error_test(i), error_train(i));
end
