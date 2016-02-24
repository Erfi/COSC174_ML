%% load the training and testing dataset
load('sarcos');

Xtrain = sarcos_training(:,1:21); Ytrain  = sarcos_training(:, 22);
Xtest = sarcos_testing(:, 1:21); Ytest = sarcos_testing(:, 22);


%% Checking your gradient: compare your gradient with the numerical gradient
perturb = 1:5;
grd = []; grd2 = [];
for i = 1:length(perturb)
    % to make sure your gradient is correct,you can compare your gradient calculating with numerical gradient
    rndIdx = randperm(size(Xtrain,1), 10);
    Xcheck = Xtrain(rndIdx, :); Ycheck = Ytrain(rndIdx);
    hiddenLayerSize = 50;
    
    fun=@(th)(nn_MSE(Xcheck, Ycheck, th)); 
    net.V = randn(hiddenLayerSize, size(Xcheck, 2));
    net.w = randn(1, hiddenLayerSize);
    [mse, grad] = fun(net); grd = [grd; [grad.w(:)', grad.V(:)']];
    [dw, dv] = numerical_gradient(fun, net);  grd2 = [grd2; [grad.w(:)', grad.V(:)']]; % evaluat the numerical gradient
end
figure; hold on;
plot(perturb, mean(grd.^2,2),'-ro'); % plot the L2 norm of true gradient
plot(perturb, mean(grd2.^2,2), '--*'); % the L2 norm of the numerical gradient
%*****If you code is correct, you should see that grd and grd2 matches closely
%with each other, and both have minimum L2 norm when perturb = 0. ******%
