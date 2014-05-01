function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% First compute the unregularized term
h_theta = X*theta;
J = (1/(2*m)) .* sum((h_theta - y) .^ 2);

% Next, regularization term. Note, theta_0 is not part of this term
temp_theta = theta;
temp_theta(1,1) = 0;

% Now the proper regularization term using temp_theta
reg_term = (lambda/(2*m)) .* sum(temp_theta.^2);

J += reg_term;

% Now, to calculate the regularized gradient
grad = (1/m) .* (X'*(h_theta - y));
reg_term = (lambda/m) .* temp_theta;

grad += reg_term;

% =========================================================================

grad = grad(:);

end