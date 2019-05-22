function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values

m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.
%theta =[1;theta];
%size(theta)
%squaredErrors = (predictions - y).^2;
%J = 1/(2*m) * sum(squaredErrors);
%squaredErrors = (predictions - y).^2;
%J = 1/(2*m) * sum(squaredErrors);
%J = (X*theta - y)' * (X*theta - y) / (2*m);

y_hat = X*theta;
error = y_hat - y;
%J = (1/(2*m)) * error' * error; 
J = (1/(2*m)) * sum(error.^2);
%predictions = X*theta;



% =========================================================================

end
