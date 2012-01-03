function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

% Useful variables
[m, n] = size(X);

% You should return these values correctly
mu = zeros(n, 1);
sigma2 = zeros(n, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the mean of the data and the variances
%               In particular, mu(i) should contain the mean of
%               the data for the i-th feature and sigma2(i)
%               should contain variance of the i-th feature.
%
fprintf('size of m: %i\n', m);
fprintf('size of n: %i\n', n);

% iterate through features
for i = 1:n
    % calculate mu 
    temp_x = 0;

    % iterate through data set and sum feature i of qth example
    for q = 1:m
        temp_x = temp_x + X(q, i); 
    end

    mu_i = (1/m) * temp_x;
    mu(i) = mu_i;
    
    % calculate sigma
    temp_sigma = 0;

    % iterate through data set 
    for k = 1:m
        x_k = X(k,i);
        s_k = (x_k - mu_i)^2;
        temp_sigma = temp_sigma + s_k; 
    end

    sig_i = temp_sigma * (1/m);
    sigma2(i) = sig_i;
end







% =============================================================


end
