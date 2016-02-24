%% for more information: http://www.mathworks.com/help/nnet/ug/generalized-regression-neural-networks.html
%% load the training and testing dataset
clear all;
rng(1); % set the random seed; please do not change or remove it, otherwise your result will not be repeatable. 
load('sarcos');
Xtrain = sarcos_training(:,1:21); Ytrain  = sarcos_training(:, 22); 
Xtest = sarcos_testing(:, 1:21); Ytest = sarcos_testing(:, 22);

% Create a Fitting Network
hiddenLayerSize = 10;
net = feedforwardnet(hiddenLayerSize);

net.trainParam.epochs = 5;

% Train the Network
[net,tr] = train(net,Xtrain',Ytrain');
 
% Test the Network
outputs = net(Xtest');
MSE = mean( (outputs - Ytest').^2 )

