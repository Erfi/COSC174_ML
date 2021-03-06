%%% Load and plot data %%%% 
clear all; 
rng('default'); rng(1);
load curveData
figure; hold on;
plot(Xtrain, Ytrain, 'o');

%% Run polynomial Regression 
% 
poly_order = 5; % order of the polynomial feature
alpha = 0;       % regularization parameter
w = [0, ones(1,poly_order)]; % weights in L2 norm; we set w(1)=0 so that we do not regularize on the constant term. 

% Apply linear regression on the polynomial feature to the data with a
% polynomial curve
theta = LinearRegWL2_train(poly_feature(Xtrain, poly_order),  Ytrain, alpha, w); % training 
hatYtest = LinearRegWL2_predict(poly_feature(Xtest,poly_order), theta); % testing
err_test = calculate_mse_Ytest_curveData(hatYtest); % calculate mse = mean((Ytest-hatYtest).^2);
fprintf('Testing Error is %d\n', err_test);
% 
% plot the curve 
Xgrid = linspace(0,10,100)';
hatYgrid = LinearRegWL2_predict(poly_feature(Xgrid,poly_order), theta); % testing
% 
figure; hold on;
plot(Xtrain, Ytrain, 'o');
plot(Xgrid, hatYgrid, '-');
legend('Training', 'Testing');


%% cross validation (Simple example):

% create a function handle that takes x and y as inputs and
% output the estimated parameter, the other parameters (poly_order, alpha, w) are
% are fixed and defined outside of the function handle. For example, you can run train_func(Xtrain, Ytrain),
% and get the same theta you had before. 
% For more info about matlab function handle, see 
% http://www.mathworks.com/help/matlab/matlab_prog/creating-a-function-handle.html
% 
Nfold = 2; % the code only works when Nfold=2 currently, please make work for general Nfold

train_func = @(x,y)LinearRegWL2_train(poly_feature(x, poly_order),  y, alpha, w);  
% create a function handle for calculaing the MSE on xtest with linear regression parameter th: 
evaluate_func = @(x, y, th)(mean((LinearRegWL2_predict(poly_feature(x, poly_order), th) - y).^2)); 
% cross validation: taking the data and train_func, predict_func as inputs and output the cross validation error 
err_xVar = cross_validation(Xtrain, Ytrain, Nfold, train_func, evaluate_func);

%% Use cross validation to select the best alpha:
Nfold = 5;
poly_order = 10; % order of the polynomial feature
w = [0, ones(1,poly_order)]; % weights in L2 norm; we set w(1)=0 so that we do not regularize on the constant term. 
alphaVec = [0,0.1,1,10,100];
err_xVar_Vec =  zeros(1,length(alphaVec));
for i = 1:length(alphaVec)
    alpha  = alphaVec(i);
    train_func = @(x,y)LinearRegWL2_train(poly_feature(x, poly_order),  y, alpha, w);  
    evaluate_func = @(x, y, th)(mean((LinearRegWL2_predict(poly_feature(x, poly_order), th) - y).^2));
    err_xVar_Vec(i) = cross_validation(Xtrain, Ytrain, Nfold, train_func, evaluate_func);
end
[~,I] = min(err_xVar_Vec);
alphabest = alphaVec(I)
% Rerun your model with the best alpha and evaluate your performance 
theta = LinearRegWL2_train(poly_feature(Xtrain, poly_order),  Ytrain, alphabest, w); % training
hatYtest = LinearRegWL2_predict(poly_feature(Xtest,poly_order), theta); % testing
err_test = calculate_mse_Ytest_curveData(hatYtest); % calculate mse = mean((Ytest-hatYtest).^2);
fprintf('Testing Error is %d\n', err_test);

 
%% Use cross validation to select the best polynomial order:
Nfold = 5;
alpha = .1;
poly_order_Vec = [1,2,3,4,5,10,20];
for i = 1:length(poly_order_Vec)
    poly_order  = poly_order_Vec(i);
    w = [0, ones(1,poly_order)]; % weights in L2 norm; we set w(1)=0 so that we do not regularize on the constant term.     
    %... please complete the code
    train_func = @(x,y)LinearRegWL2_train(poly_feature(x, poly_order),  y, alpha, w);  
    evaluate_func = @(x, y, th)(mean((LinearRegWL2_predict(poly_feature(x, poly_order), th) - y).^2));
    err_xVar_Vec(i) = cross_validation(Xtrain, Ytrain, Nfold, train_func, evaluate_func);
end
[~,I] = min(err_xVar_Vec);
poly_order_best = poly_order_Vec(I)
% Rerun your model with the best poly_order
w = [0, ones(1,poly_order_best)];
theta = LinearRegWL2_train(poly_feature(Xtrain, poly_order_best),  Ytrain, alpha, w); % training
hatYtest =  LinearRegWL2_predict(poly_feature(Xtest,poly_order_best), theta); % testing
err_test = calculate_mse_Ytest_curveData(hatYtest); % calculate mse = mean((Ytest-hatYtest).^2);
fprintf('Testing Error is %d\n', err_test);

