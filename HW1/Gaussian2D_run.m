mu = [1; -1];  Sigma = [3,1; 1,3]; % define parameters

[X1,X2] = meshgrid([-6:1:6], [-6:1:6]); % specify points in a grid

% calculate the likelihood
P = zeros(size(X1));
for i = 1:size(X1,1)
    for j = 1:size(X2, 2)
        P(i,j)=mvnpdf([X1(i,j), X2(i,j)]', mu, Sigma);
    end
end

figure; 
subplot(1,2,1); contour(X1,X2,P, 'color', 'red'); title('Contour');
subplot(1,2,2); surf(X1, X2, P); title('Surface');

    