function [y, dydx] = logsumexp(x)
% calculate the log-sum-exp function and its gradient 
% Inputs: 
%      --- x: a n X d matrix
% Outputs:
%      --- y: a n X 1 vector, where y(i) = logsumexp(x(i,:)) 
%      --- dydx: a n X d vector, where dydx(i,:) is the gradient of logsumexp
%      evaluated at x(i,:)
%   


% Please modify the following naive implementation using the log-sum-exp 
% trick we discussed in the class to avoid the overflow/underflow problem
%y=log(sum(exp(x),2));%with over/under flow problem
% dydx = exp(x)./repmat(sum(exp(x),2), 1, size(x,2));%with over/under flow problem

tMax = max(x, [], 2);%n X 1 vector containing the maximum of each row of x
var = log(sum(exp(x-repmat(tMax,1,size(x,2))),2));
y = tMax + var;
dydx = exp(x-repmat(tMax,1,size(x,2))) ./ repmat(sum(exp(x-repmat(tMax,1,size(x,2))),2),1,size(x,2));

