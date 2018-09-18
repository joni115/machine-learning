function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));


regularized_parameter = lambda / 2;

regurarized = regularized_parameter * sum(sum(Theta .^ 2)) + regularized_parameter * sum(sum(X .^ 2));

M = (X * Theta' - Y) .* R;
J = sum(sum(M .^ 2)) / 2 + regurarized;

X_grad = M * Theta + lambda .* X;
Theta_grad = M' * X + lambda .* Theta;


grad = [X_grad(:); Theta_grad(:)];

end
