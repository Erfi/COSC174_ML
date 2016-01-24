close all;
clear all;
%======Setup=======
iris=load('data/iris.txt'); 
y=iris(:,end); 
X=iris(:,1:end-1);

n = size(X,1);
d = size(X,2);

dxtrain = 1:round(0.75*n);
dxtest = setdiff(1:n, dxtrain);

Xtrain = X(dxtrain, :); 
Xtest = X(dxtest, :);
Ytrain = y(dxtrain, :);
Ytest = y(dxtest, :);
%===End of Setup======


w = [2,1]; K = 2;
Ytest_hat = WeightedKNN(Xtest(:,1:2), K, w, Xtrain(:,1:2), Ytrain);
% KNN prediction;
Error_test = mean(Ytest_hat ~= Ytest);
% Calculate testing error;
Ytrain_hat = WeightedKNN(Xtrain(:,1:2), K, w, Xtrain(:,1:2), Ytrain); 
Error_train = mean(Ytrain_hat ~= Ytrain);
% Calculate training error


