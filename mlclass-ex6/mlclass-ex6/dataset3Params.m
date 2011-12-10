function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
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

% model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));

vals = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

lowest_error = 10;
c_val = 0;
s_val = 0;

for c_index = 1:8
    for s_index = 1:8
        %fprintf('training...cindex %i...s_index %i\n',c_index, s_index);
        C = vals(c_index);
        sigma = vals(s_index);
        %fprintf('C : %f\n', C);
        %fprintf('sigma : %f\n', sigma);
        model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
        predictions = svmPredict(model, Xval);
        predict_error = mean(double(predictions ~= yval));
        if (predict_error < lowest_error)
            lowest_error = predict_error;
            c_val = C;
            s_val = sigma;
        end
        %fprintf('prediction_error : %f\n', predict_error);
    end
end

C = c_val;
sigma = s_val;


% =========================================================================

end
