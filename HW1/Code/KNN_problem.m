close all;

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


for K = 1:9
 Ytest_hat(:,K) = KNN(Xtest, K, Xtrain, Ytrain);
 % KNN prediction;
 Error_test(:,K) = mean(Ytest_hat(:,K) ~= Ytest);
 % Calculate testing error; 
 Ytrain_hat(:,K) = KNN(Xtrain, K, Xtrain, Ytrain); 
 Error_train(:,K) = mean(Ytrain_hat(:,K) ~= Ytrain); 
 % Calculate training error (which is zero in the case of (K = 1));
end

%==========Plot the errors============
kLen = [1:K];
plot(kLen, Error_train, kLen, Error_test);
title('Training Error and Testing Error');
xlabel('K');
ylabel('Training/Testing Errors');
legend('Training Error','Testing Error');

%===============================
%== Optimal K value ---> 5,6,7 =
%===============================
 