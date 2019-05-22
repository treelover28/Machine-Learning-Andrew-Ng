function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% define hypothesis y_hat
y_hat = sigmoid(X*theta); 

% y.*log(y_hat) times each element 
% Remember that we don't penalize theta0 in cost function as well!
J = (-1/m) * sum(y.*log(y_hat) + (1-y).*log(1-y_hat)) + ((lambda/(2*m)) * sum(theta(2:end).^2));

% We don't penalize theta0
% theta0 
grad(1) = (1/m)*sum((y_hat-y).*X(:,1));

for n = 2: size(theta,1)
  %Each error in each training example time each corresponding example of feature X.
  grad(n) = (1/m)*sum((y_hat-y).*X(:,n)) + ((lambda/m).*theta(n));
end;




% =============================================================

end
