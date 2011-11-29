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


sig_theta = sigmoid(X * theta);


% theta(0) is not used in the regularization term
regFunc = (lambda/ (2*m)) * (theta(2:end)' * theta(2:end));

J = (1/m) * sum( -y.* log(sig_theta) - (1 - y).* log(1 - sig_theta) ) + regFunc;

gradFunc = (lambda) * sig_theta';

%gradFunc
length(gradFunc);

%calc = (sig_theta - y);
%grad = (1/m) * ( ( X' * calc ) );

regGrad = (lambda/m) * theta;

%size(theta)

%theta

theta1 = (1/m) * sum( sig_theta - y ) * X(1);

%theta2 = (1/m) * (X(1)' * (sig_theta - y))
%size(theta2)
%theta2

thetarest = (1/m) * (X' * (sig_theta -y)) + regGrad;

%size(thetarest)

grad(1) = theta1;

grad(2:end) = thetarest(2:end);

%for i = thetarest(2:end)
%    grad(i) = thetarest(i)
%end

%size(grad)

%grad = ( (1/m) * (X' * (sig_theta - y)) ) + regGrad;



% =============================================================

end
