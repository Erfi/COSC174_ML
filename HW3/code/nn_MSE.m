function [mse, grad] = nn_MSE(X , Y, net)
% n = # of data points; d = # of data features; h = # of hidden units
% Input:
%   - X (n X d): the feature
%   - Y (n X 1): the target labels
%   - net: a structure that stores the network weights
%      -- net.w (1 X h): top layer weights
%      -- net.V (h X d): first layer weights

% Output:
%   - mse (1 X 1): the MSE cost
%   - grad.w (1 X h): gradients of MSE w.r.t. w
%   - grad.V (h X d): gradients of MSE w.r.t. V



h = size(net.V,1);
d = size(net.V,2);
    
%% 
hatY  = (net.w * sigmoid(net.V * X'))'; % prediction
mse = mean((hatY - Y).^2); % calculate MSE

%% compute the gradients (please debug!!)
if nargout > 1    
    % calculating the gradient w.r.t. w: size(grad.w) = 1 X h;
    grad.w = 2*(Y - hatY)'*sigmoid(net.V*X')'/n; 
    % calculating the gradient w.r.t. V: size(grad.V) = h X d;
    grad.V = 2*((repmat(Y-hatY, 1, d).* sigmoid(net.V*X')')*X) .* repmat(net.w,1,d)/n;
end

return;
end



function f  = sigmoid(x)
% sigmoid function: 
    f = 1 ./ (1 + exp(-x));
end

function f = dsigmoid(x)
% derivative of sigmoid function:
    f = sigmoid(x) .* (1-sigmoid(x));
end
