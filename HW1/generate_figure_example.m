close all;

iris=load('data/iris.txt'); y=iris(:,end); X=iris(:,1:end-1);

%====1.a -- Plotting the histogram of each feature=====
hist(X(:,1));
title('Histogram of Feature 1');
figure;
hist(X(:,2));
title('Histogram of Feature 2');
figure;
hist(X(:,3));
title('Histogram of Feature 3');
figure;
hist(X(:,4));
title('Histogram of Feature 4');
%======================================================

%=====1.b -- computing the mean of each feature========
means(1) = mean(X(:,1));
means(2) = mean(X(:,2));
means(3) = mean(X(:,3));
means(4) = mean(X(:,4));
%======================================================

%=1.c -- computing the Varience and stdv of each feature=
stds(1) = std(X(:,1));
stds(2) = std(X(:,2));
stds(3) = std(X(:,3));
stds(4) = std(X(:,4));

vars(1) = var(X(:,1));
vars(2) = var(X(:,2));
vars(3) = var(X(:,3));
vars(4) = var(X(:,4));
%======================================================

%==================1.d -- Normalize====================
norms(:,1) = bsxfun(@rdivide, bsxfun(@minus, X(:,1), mean(X(:,1))), std(X(:,1)));
norms(:,2) = bsxfun(@rdivide, bsxfun(@minus, X(:,2), mean(X(:,2))), std(X(:,2)));
norms(:,3) = bsxfun(@rdivide, bsxfun(@minus, X(:,3), mean(X(:,3))), std(X(:,3)));
norms(:,4) = bsxfun(@rdivide, bsxfun(@minus, X(:,4), mean(X(:,4))), std(X(:,4)));
%======================================================

%=========1.e -- Plot features against each other======
scatter(norms(:,1), norms(:,2),50, y, 'fill');
title('Normalized feature1 vs. feature2');
xlabel('feature1');
ylabel('feature2');

figure;
scatter(norms(:,1), norms(:,3),50, y, 'fill');
title('Normalized feature1 vs. feature3');
xlabel('feature1');
ylabel('feature3');

figure;
scatter(norms(:,1), norms(:,4),50, y, 'fill');
title('Normalized feature1 vs. feature4');
xlabel('feature1');
ylabel('feature4');
%======================================================
