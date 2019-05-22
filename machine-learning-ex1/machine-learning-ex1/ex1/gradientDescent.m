function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
	predictions = X * theta;
	% since theta = [ theta0; theta1] Dimension 2X1
	% formula: theta(j) := theta(j) - alpha * 1/m * sum((prediction - y)x(j)).	
	% sigma0 is calculated by .*X(:,1) for theta0, because first row in X is just 1...
	% sigma1 is calculated similarly by .*X(:,2). 
	error = predictions - y;
	sigma0 = 1/m * sum(error.* X(:,1));
	sigma1 = 1/m * sum(error.* X(:,2));
	theta0 = theta(1) - alpha * sigma0;
	theta1 = theta(2) - alpha * sigma1;
	
	theta = [theta0; theta1];
	

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end;

end;
