K = 1; 
Ytest_hat = KNN(Xtest, K, Xtrain, Ytrain);
 % KNN prediction with K=1;
 
 Error_test = mean(Ytest_hat ~= Ytest); 
 % Calculate testing error; 
 
 Ytrain_hat = KNN(Xtrain, K, Xtrain, Ytrain); 
 Error_train = mean(Ytrain_hat ~= Ytrain); 
 % Calculate training error (which is zero in this case (since K = 1));
 