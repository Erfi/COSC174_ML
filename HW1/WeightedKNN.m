function Ytest_hat = WeightedKNN(Xtest, K, w, Xtrain, Ytrain)
% Implement K-nearest neighorhood classification. 
%
% Input:  
%    -- Xtest: feature of test data (a n X d matrix; each row is an instance, each column is a feature)
%    -- K: number of nearest neighorhood points
%    -- Xtrain: feature of training data (a n X d matrix)
%    -- Ytrain: true target value of training data (a n X 1 vector)
%    -- w: the importance weights for each feature (a dX1 vector) 
%
% Output: 
%    -- Ytest_hat: predicted target value on the test data 

if all(w==1)&& (K==1)
    dist=pairwise_distance(Xtest, Xtrain);
    [~, maxindex]  = min(dist, [], 2);
    Ytest_hat = Ytrain(maxindex);
else
   % Please complete the case when w ~= 1 or K>1
end



return;
end


function dist = pairwise_distance(X1, X2)
% Return the pairwise distance between X1 and X2
% X1: n1 X d matrix 
% X2: n2 X d matrix
% dist: n1 X n2 matrix, dist(i,j)= dist(X1(i,:), X2(j,:));

n1 = size(X1,1); n2 = size(X2,1);
dist=sqrt(repmat(sum(X1.^2,2), 1, n2) + repmat(sum(X2.^2, 2)', n1, 1) - 2*(X1*X2'));
end