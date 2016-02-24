function  [dw, dv] = numerical_gradient(fun, net, epsilon)
% evaluate the numerical gradient of function fun at theta
%

if nargin < 3, epsilon = 1e-5; end

dw = zeros( size(net.w) ); dv = zeros( size(net.V) );
for i = 1:length(net.w(:))
    net2 = net; net2.w(i) = net.w(i) + 1e-5;
    dw(i) = (fun(net2)-fun(net)) / epsilon;
end

for i = 1:length(net.V(:))
    net2 = net; net2.V(i) = net.V(i) + 1e-5;
    dv(i) = (fun(net2)-fun(net)) / epsilon;
end