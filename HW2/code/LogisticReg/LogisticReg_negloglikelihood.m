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
%    -- negDlogp: (K X d) the gradient of negative log-likelihood


K = size(theta,1);
n = size(Xtrain,1);
d = size(Xtrain,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Please complete the code ...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%loop version

% den = zeros(1,n); %denomenator of the J(theta)'s log part
% neglogp = 0;
% for i = 1:n %for all the abservations
%     for k = 1:K %for all the classes
%         den(i) = den(i) + exp(theta(k,:)*Xtrain(:,i)); %makes a scalar from dot producting theta(k) by Xtrain(i) to get what gives the hypothesis for one fo the predictions
%     end
% end
% 
% 
% for i = 1:n
%    for k = 1:K
%        if(Ytrain(i) == k)% if the Ytrain label is the same as class label k
%            neglogp = neglogp + log(exp(theta(k,:)*Xtrain(:,i))/den(i));
%        end
%    end
% end


% reg = alpha*sum(theta.^2);% the regularization term
% neglogp = neglogp + reg;


% t = theta*Xtrain'; 
t=Xtrain*theta';
t = bsxfun(@minus, t, max(t, [], 1));% to deal with the over/under flow (basically the same as logsumexp())
hyp = exp(t);%hypothesis
hyp = bsxfun(@rdivide, hyp, sum(hyp));
% disp('after');
% size(Ytrain) %1000*1
% size(log(hyp)) %1000*2
neglogp = -(sum(Ytrain'*log(hyp)))/n + sum(sum(theta.^2)); 

%========derivative=========
negDlogp = (bsxfun(@minus, hyp,Ytrain)'*Xtrain)/n + alpha*theta;

end


