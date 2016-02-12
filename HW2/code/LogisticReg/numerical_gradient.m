function  df = numerical_gradient(fun, theta,epsilon)
% evaluate the numerical gradient of function fun at theta
%

if nargin < 3, epsilon = 1e-5; end

df = zeros(size(theta));

for i = 1:length(theta(:))
    theta2 = theta; theta2(i) = theta(i)+1e-5;
    df(i) = (fun(theta2)-fun(theta))/epsilon;
end