function  theta = LinearRegWL2_train(Xtrain, Ytrain, alpha, w)
% Weighted Linear Regression: 
% Inputs (n: # of data points; d: number of features): 
%     -- Xtrain: (n X d) training features
%     -- Ytrain: (n X 1) training labels
%     -- alpha: (1 X 1) regularization
%     -- w:     (1 X d) weights in the L2 regularization
% 
% Outputs: 
%     -- theta: (1 X d) the parameter

%trying to solve Ax=B where A = (XX+aW), B = (YX), and x = theta
A = (Xtrain'*Xtrain + diag(alpha*w));
B = (Ytrain'*Xtrain);
theta = (A\B')';