function [hatYtest, Pyx] = LogisticReg_predict(Xtest, theta)
% Making prediction in multi-class logistic regression 
% Inputs (n = #_of_data_points, d = #_of_features, K = #_of_classes): 
%    -- Xtest (n X d) features
%    -- theta  (K X d) parameters
%
% Outputs: 
%    -- hatYtest: (n X 1) the predicted labels (in the range of {1,...,K})
%    -- PyX: (n X K) the prediction probability p(y | x); Pyx(i,j) should
%    equal p(y_i = j | x_i). 



f = Xtest*theta';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Please complete the code here
f = bsxfun(@minus, t, max(t, [], 1));% to deal with the over/under flow (basically the same as logsumexp())
Pyx = exp(t);%hypothesis
Pyx = bsxfun(@rdivide, Pyx, sum(Pyx));
% hatYtest =    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
