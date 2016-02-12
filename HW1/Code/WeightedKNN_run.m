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

w1 = [0.01, 0.1, 1, 10, 100];
w2 = [0.01, 0.1, 1, 10, 100];% just for comparison!
% w1 = [0.01:0.1:100];
for count = 1:size(w1,2)
    w = [w1(count),1]; K = 2;
    Ytest_hat = WeightedKNN(Xtest(:,1:2), K, w, Xtrain(:,1:2), Ytrain);
    % KNN prediction;
    Error_test(count) = mean(Ytest_hat ~= Ytest);
    % Calculate testing error;
    Ytrain_hat = WeightedKNN(Xtrain(:,1:2), K, w, Xtrain(:,1:2), Ytrain); 
    Error_train(count) = mean(Ytrain_hat ~= Ytrain);
    % Calculate training error
end

plot(w1,Error_test, w1, Error_train);
title('Train and Test Errors usng variable w(1)');
xlabel('w(1)');
ylabel('Train/Test Errors');
legend('Test Error','Train Error');

%============================
%====Optimal w(1) ---> 1=====
%============================

