%input data
x = fluML(1:200,10)
y = fluML(1:200,17)
% initializing iterations and choosing theta and alpha values 
m = length(x);
iterations = 500;
theta = [0 1].';
alpha = 0.02;
mat = [ones(m,1) x];
%function for Gradient Descent and Cost Function
[theta_mat ,jValues] = CalculatingGradientDescentr(mat,y,theta,alpha,iterations);
j=CalculatingCostr(mat,y,theta);
thetaValues=[theta_mat jValues];
theta1 = thetaValues(:,1);
theta2 = thetaValues(:,2);
th1 =theta1(length(theta1))
th2 =theta2(length(theta2))
zt= th1 + (th2 *x);
h = 1 ./(1 + exp(-zt));
confusion_matrix = string(zeros(length(hypothesis),1));

for i=1:length(hypothesis)
    if(hypothesis(i)==0 && y(i) == 0)
       confusion_matrix(i) = "tp";

    elseif(hypothesis(i) ==0 && y(i) == 1)
        confusion_matrix(i) = "fp";
    
    elseif(hypothesis(i) ==1 && y(i) == 0)
        confusion_matrix(i) = "fn";

    else
        confusion_matrix(i) = "tn";

        end

end
 
b=count(confusion_matrix,"tp");
tp=sum(b)
c=count(confusion_matrix,"tn");
tn=sum(c)
d=count(confusion_matrix,"fp");
fp=sum(d)
e=count(confusion_matrix,"fn");
fn=sum(e)
precision = tp/(tp+fp)
recall = tp/(tp+fn)
% plotting a graph between iteration and cost function
figure;
iteration = 1:500;
plot(iteration,jValues);
title('graph for iteration and cost function');
xlabel('iteration');
ylabel('cost function');
accuracy = (tp+tn)/m
f1accuracy=2*(precision*recall)/(precision + recall)

