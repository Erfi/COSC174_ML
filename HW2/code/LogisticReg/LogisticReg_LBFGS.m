function  theta = LogisticReg_LBFGS(Xtrain, Ytrain, alpha, theta0, maxIter)
% Logistic Regression using minFunc
% Inputs: 
%   -- Xtrain (n X d): features
%   -- Ytrain (n X 1): labels, have to take values in {1,...,K}
%   -- alpha  (1 X 1): regularization coefficient
%   -- theta0 (K X d): initialization of the parameter (default = 0)
%   -- maxIter(1 X 1): maximum number of iterations in the algorithm  (default = 100)
% 
% 
% Outputs: 
%   -- theta (K X d): the optimization result;


d = size(Xtrain,2); 
K = size(theta0,1);

% create a function handle for negloglikelihood; the parameter theta and the gradient is
% flatten into a vector (do not modify this part)
func = @(th)flat_LogisticReg_negloglikelihood(Xtrain, Ytrain, th, alpha, K);

% set LBFGS parameters (do not modify this part)
if nargin < 5, theta0 = 0;  end
if nargin < 6, maxIter = 100;  end
options.Method = 'lbfgs'; 
options.maxIter = maxIter; % set the maximum number of iterations
theta = minFunc(func, theta0(:), options);                

options = optimoptions('fminunc','Algorithm','trust-region','GradObj','on');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theta = fminunc(func,theta0,options);
%... % please finish the code here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%transform theta back into a matrix (do not modify this part)
theta = reshape(theta, K, d);


return;
end

function [neglogp, negDlogp] = flat_LogisticReg_negloglikelihood(Xtrain, Ytrain, theta, alpha, K)
% Since minFunc only works on objective functions with vector inputs; we
% flatten the matrix theta into a column vector. 

d = size(Xtrain,2); 
theta = reshape(theta, K, d);
[neglogp, negDlogp]= LogisticReg_negloglikelihood(Xtrain, Ytrain, theta, alpha);

negDlogp = negDlogp(:);
end



