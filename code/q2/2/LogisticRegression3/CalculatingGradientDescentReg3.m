function[theta_mat,j_history] = CalculatingGradientDescentReg3(mat,y,theta,alpha,iterations)
m = length(y);
j_history = zeros(iterations, 1);
theta_mat = ones(iterations, 4);
for i =1:iterations
    h = 1./(1 + exp(-(mat* theta)));
    t1 = theta(1)-alpha*(1/m)*sum(h-y);
    t2 = theta(2) - alpha*(1/m)*sum((h-y).*mat(:, 2));
    t3 = theta(3) - alpha*(1/m)*sum((h-y).*mat(:, 3));
    t4 = theta(4) - alpha*(1/m)*sum((h-y).*mat(:, 4));
    theta(1) = t1;
    theta(2) = t2;
    theta(3) = t3;
    theta(4) = t4;
    theta_mat(i,1) = theta(1);
    theta_mat(i,2) = theta(2);
    theta_mat(i,3) = theta(3);
    theta_mat(i,4) = theta(4);
    j_history(i) = CalculatingCostReg3(mat,y,theta);
end
end