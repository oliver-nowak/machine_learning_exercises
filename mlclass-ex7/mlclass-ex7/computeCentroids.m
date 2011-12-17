function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

fprintf('numExamples %i\n', m);
fprintf('numClasses %i\n', K);

for c = 1:K
    centroid = [];
    for i = 1:m
        k = idx(i);

        if (k == c) 
            pt = X(i,:);
            centroid = [centroid; pt];
        end
    end
    % get the number of points belonging to centroid
    size_c = size(centroid,1);

    % sum vector across columns
    centroid = sum(centroid);

    % divide the result by num of points to get mean
    centroid = centroid./size_c;

    % add to list of centroids
    centroids(c,:) = centroid;

    fprintf('K=%i : num=%i\n', c, size(centroid, 1));
end



% =============================================================


end

