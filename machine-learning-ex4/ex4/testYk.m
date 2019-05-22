load('ex4weights.mat');
%k = 1; 
%yk = y(1)==k; 
%yk

Theta2_grad = zeros(size(Theta2));
size(Theta2_grad)
size(Theta2_grad(2:end))
%Theta2_grad
%Theta2_grad(2:end,:)
%size(Theta2_grad(1,:))
delta3 = ones(10,5000);
a2 = 2 * ones(5000,26);
Theta2_grad = Theta2_grad + delta3*a2;
size(Theta2_grad)