function err_xVar = cross_validation(Xtrain, Ytrain, Nfold, train_func, evaluate_func)
% Cross validation: 
% Inputs: 
%    --- Xtrain (nXd), Ytrain (nX1): training data
%    --- Nfold: number of partitions in cross validation
%    --- train_func: a function handle that takes X and Y as inputs and
%    ouput estimated parameter \hat\theta
%   --- predict_func: a function handle that takes (X, Y) and parameter \hat\theta as
%   inputs and outputs a testing error 
%
% Output: 
%    --- err_xVar: (1X1) the averaged cross validation error.  

if Nfold == 2
    n = size(Xtrain,1);
    K = ceil(n/2); set1 = 1:K; set2 = K+1:n; % partition the data into two sets
    
    theta=train_func(Xtrain(set1,:), Ytrain(set1,:)); % train on set1
    err_xVar_Vec(1)=evaluate_func(Xtrain(set2,:), Ytrain(set2,:), theta);  % test on set2
    
    theta=train_func(Xtrain(set2,:), Ytrain(set2,:)); % train on set2
    err_xVar_Vec(2)=evaluate_func(Xtrain(set1,:), Ytrain(set1,:), theta);  % test on set1
    
    err_xVar = mean(err_xVar_Vec); % average the error rates        
    
                
else 
   n = size(Xtrain,1); %size of the training set
   K = ceil(n/Nfold);%max length of each fold
   startIndex = 1;%start of a sub-dataset
   endIndex = K;%end of a sub-dataset
   for i = 1:Nfold
      set{i} = startIndex:endIndex;
      if(i+1 ~= Nfold) %if not the second to last set
        startIndex = endIndex+1;
        endIndex = endIndex+K;
      else
          startIndex = endIndex+1;
          endIndex = n;
      end
   end
   
   errIndex = 1;
   for j = 1:Nfold %how many times to train
       theta=train_func(Xtrain(set{j},:), Ytrain(set{j},:)); % train on set(j)
       for k = 1:Nfold
          if(k ~= j)%don't test on the training subset, that's cheating!
              err_xVar_Vec(errIndex)=evaluate_func(Xtrain(set{k},:), Ytrain(set{k},:), theta);  % test on set(k)
              errIndex = errIndex+1;
          end
       end
   end
   err_xVar = mean(err_xVar_Vec); % average the error rates  
end

