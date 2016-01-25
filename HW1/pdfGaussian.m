function px = pdfGaussian(X, mu, Sigma)
% Calculate the likelihood for a multivariate Gaussian distribution
dims = size(X,2); %number of features
var1 = (1/(2*pi*sqrt(det(Sigma))))^dims; %broken down for debugging purpose
var2 = (-1/2)*sum((X-mu)'/(Sigma)*(X-mu));%broken down for debugging purpose
px = var1*exp(var2);
end


