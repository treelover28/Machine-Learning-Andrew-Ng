function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

C_trials = [0.01 0.03 0.1 0.3 1 3 10 30];
sigma_trials = [0.01 0.03 0.1 0.3 1 3 10 30];
c = length(C_trials);
s = length(sigma_trials);

for i =1:c
  for k=1:s
    C = C_trials(i);
    sigma = sigma_trials(k);
    % Call svmTrain to model for this pair of C and sigma
    model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
    % Use parameter obtained above on cross-validation set
    pred = svmPredict(model,Xval);
    pred_err(i,k) = mean(double(pred ~= yval)); % average of value where prediction != yVal label gives number of misclassification 
  end
end

min_err = min(min(pred_err));
[i,k] = find(pred_err == min_err); % find the C and sigma that gives lowest error
C = C_trials(i)                    % set C and sigma to optimal values.
sigma = sigma_trials(k)


% =========================================================================

end
