function [neglogp, negDlogp]= LogisticReg_negloglikelihood(Xtrain, Ytrain, theta, alpha)
% Calculate the negative log-likelihood for multi-class logistic regression 
% Inputs (n = #_of_data_points, d = #_of_features, K = #_of_classes): 
%    -- Xtrain (n X d) features
%    -- Ytrain (n X 1) multiclass labels who can take values in {1,2,...,K}
%    -- theta  (K X d) parameters
%    -- alpha  (1 X 1) regularization parameter
%
%
% Outputs: 
%    -- neglogp: (1 X 1) the negative log-likelihood
%    -- negDlogp: (d X 1) the gradient of negative log-likelihood


K = size(theta,1);
n = size(Xtrain,1);
d = size(Xtrain,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Please complete the code ...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end


