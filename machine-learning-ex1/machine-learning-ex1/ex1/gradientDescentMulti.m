function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
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
    %       of the cost function (computeCostMulti) and gradient here.
    %
   
	% since theta = [ theta0; theta1] Dimension 2X1
	% formula: theta(j) := theta(j) - alpha * 1/m * sum((prediction - y)x(j)).	
	% sigma0 is calculated by .*X(:,1) for theta0, because first row in X is just 1...
	% sigma1 is calculated similarly by .*X(:,2). 
predictions = X*theta;
%theta_temp = ones(3,1);
  for r = 1:size(theta,1)
    theta(r) = theta(r) - alpha * (1/m)* sum((predictions-y).*X(:,r));
  end;

%theta = theta_temp;

%theta(1) = theta(1) - alpha * (1/m)* sum((predictions-y).*X(:,1));
%theta(2) = theta(2) - alpha * (1/m)* sum((predictions-y).*X(:,2));
%theta(3) = theta(3) - alpha * (1/m)* sum((predictions-y).*X(:,3));

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
