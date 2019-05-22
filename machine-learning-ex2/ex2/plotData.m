function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

% find indices of positive and negative example
passed = find(y==1);
failed = find(y==0);

%Plot data
% X(positive,n) refers to value at row with y = 1 (passed) and column 1 and 2 for exam scores.
plot(X(passed,1),X(passed,2), 'k+','LineWidth',2,'MarkerSize',7);
% X(failed,n) refers to number at row with y = 0 ( failed) and column 1 and 2 for exam scores.
plot(X(failed,1),X(failed,2), 'ko','MarkerFaceColor','y','MarkerSize',7);
%MarkerFaceColor, y refers to yellow circles. 







% =========================================================================



hold off;

end
