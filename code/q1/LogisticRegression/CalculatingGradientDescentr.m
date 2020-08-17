function [theta_mat1,jValues] = CalculatingGradientDescentr(mat,y,theta,alpha,iterations)
m = length(y);
jValues = zeros(iterations, 1);
theta_mat1 = zeros(iterations, 2);
for i =1:iterations
    h = 1./(1 + exp(-(mat* theta)));
    t1 = theta(1)-alpha*(1/m)*sum(h-y);
    t2 = theta(2) - alpha*(1/m)*sum((h-y).*mat(:, 2));
    theta(1) = t1;
    theta(2) = t2;
    theta_mat1(i,1) = theta(1);
    theta_mat1(i,2) = theta(2);
    jValues(i) = CalculatingCostr(mat,y,theta);
end

end