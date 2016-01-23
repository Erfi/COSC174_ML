iris=load('data/iris.txt'); y=iris(:,end); X=iris(:,1:end-1);

figure; 
hist(X(:,1),20);
set(gca, 'fontsize',30);

print -dpdf figures/hist_iris