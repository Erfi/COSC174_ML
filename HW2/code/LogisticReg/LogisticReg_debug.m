clear all;
% Simulate a toy dataset using the logistic probablistic model. This is to help
% you debug and verify your code. 
rng('default'); rng(1); %set the seed for the random number generator so that the result is reproducable 
K = 2; d = 2; n = 1000; % K=# of classes; d = # of features; n = # of data points
thetaTrue= rand(K,d); thetaTrue = thetaTrue-repmat(mean(thetaTrue,1),2,1); % generate a ``ground truth" for theta
X =  rand(n,d); % generate feature X randomly
pyx = exp(X*thetaTrue')./ repmat(sum(exp(X*thetaTrue'),2), 1, K); % calculate logistic p(y|x) 
Y = 1 + (rand(n,1)>=pyx(:,1)); % sample Y from p(y|x)

%% Verifying the logsumexp function
% Verifying the gradient of logsumexp
[y,dy]=logsumexp([1000,1001.2, 999.9])
[y,dy]=logsumexp([-1000,-1001])
%% Verifying your negative log-likelihood function: if it is correct, it should achieves the minimum value at the true parameter thetaTrue
alpha = 0;
noise = randn(size(thetaTrue));
perturb = -5:5;
neglogpVec = zeros(size(perturb));
for i = 1:length(perturb)
    theta = thetaTrue+perturb(i)*noise; 
    neglogpVec(i) = LogisticReg_negloglikelihood(X, Y, theta, alpha);
end
figure;
hold on;
plot(perturb, neglogpVec,'--r');
%******* If your code is correct, you should see that neglogpVec achieves minimum
% value when perturb = 0. *******%

%% Checking your gradient: compare your gradient with the numerical gradient
% to make sure your gradient is correct,you can compare your gradient calculating with numerical gradient
noise = randn(size(thetaTrue));
alpha = 0;    
fun=@(th)(LogisticReg_negloglikelihood(X, Y, th, alpha)); % construct a function handle of neg-log-likelihood
perturb = -5:5;
for i = 1:length(perturb)
    theta = thetaTrue+perturb(i)*noise;
    [neglogpVec(i), negDlogp]= fun(theta); grd(i,:) = negDlogp(:);
    tmp = numerical_gradient(fun, theta);  grd2(i,:) = tmp(:); % evaluat the numerical gradient
end

figure; hold on;
plot(perturb, mean(grd.^2,2),'-ro'); % plot the L2 norm of true gradient
plot(perturb, mean(grd2.^2,2), '--*'); % the L2 norm of the numerical gradient 
%*****If you code is correct, you should see that grd and grd2 matches closely
%with each other, and both have minimum L2 norm when perturb = 0. ******%

