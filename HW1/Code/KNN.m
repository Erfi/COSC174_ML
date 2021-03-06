function Ytest_hat = KNN(Xtest, K, Xtrain, Ytrain)
% Implement K-nearest neighorhood classification. 
%
% Input:  
%    -- Xtest: feature of test data (a n X d matrix; each row is an instance, each column is a feature)
%    -- K: number of nearest neighorhood points
%    -- Xtrain: feature of training data (a n X d matrix)
%    -- Ytrain: true target value of training data (a n X 1 vector)
%
% Output: 
%    -- Ytest_hat: predicted target value on the test data 

if K == 1
    dist=pairwise_distance(Xtest, Xtrain);
    [~, maxindex]  = min(dist, [], 2);
    Ytest_hat = Ytrain(maxindex);
else
   dist = pairwise_distance(Xtest, Xtrain);
   %now sort the each row of the dist and return the index of the first k
   %ones
   [~, I] = sort(dist,2); % I is a matrix. Each row is the sorted distance of testing data from the training data
   K_indecies = I(:,1:K); % first K columns of I
   for col = 1:size(K_indecies,2)
       K_labels(:,col) = Ytrain(K_indecies(:,col));
   end
   Ytest_hat = mode(K_labels,2);
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