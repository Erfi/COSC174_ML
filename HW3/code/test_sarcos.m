%% load the training and testing dataset
clear all;
load sarcos;
rng(1);
Xtrain = sarcos_training(:,1:21); Ytrain  = sarcos_training(:, 22); 
Xtest = sarcos_testing(:, 1:21); Ytest = sarcos_testing(:, 22);

% Feel free to tune these hyperparameters
% number of hidden units
params.hidden_units = 200;
% SGD, batch size
params.batch_size = 10;
% SGD, step size
params.step_size = 1e-4;
% epoches
params.max_epoches = 30;

% Try nn with 10 hidden units. 
params.hidden_units = 10; 
[net, mse] = nn_train( [ones(size(Xtrain,1),1),Xtrain], Ytrain, params);
figure;
plot(1:length(mse), mse, '-ro', 'LineWidth', 4, 'MarkerSize', 8);
xlabel('Epoch', 'FontSize', 20); ylabel('MSE', 'FontSize', 20);

% calculate the MSE on both the training and testing datasets.
mse_test = nn_MSE([ones(size(Xtest,1),1), Xtest], Ytest, net);
mse_train =  nn_MSE([ones(size(Xtrain,1),1), Xtrain], Ytrain, net);

%% use cross validation to select the best number of hidden units
hidden_units = [10 50 100 200];
hu_best = hidden_units(1);
hu_best_MSE = inf;

for i=1:length(hidden_units)
    params.hidden_units = hidden_units(i); 
    [net, mse] = nn_train( [ones(size(Xtrain,1),1),Xtrain], Ytrain, params);
    figure;
    plot(1:length(mse), mse, '-ro', 'LineWidth', 4, 'MarkerSize', 8);
    xlabel('Epoch', 'FontSize', 20); ylabel('MSE', 'FontSize', 20);

    % calculate the MSE on both the training and testing datasets.
    mse_test = nn_MSE([ones(size(Xtest,1),1), Xtest], Ytest, net);
    mse_train =  nn_MSE([ones(size(Xtrain,1),1), Xtrain], Ytrain, net);
    if(mse_test < hu_best_MSE)
        hu_best = hidden_units(i);
        hu_best_MSE = mse_test;
    end
end
fprintf('Best hidden unit size: %d with mse of %.4f\n', hu_best, hu_best_MSE);

