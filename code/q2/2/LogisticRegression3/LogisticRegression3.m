%input data
a = fluML(1:200, 10);
b = fluML(1:200, 17);
c = fluML(1:200,3);
d = fluML(1:200,14);
%Normalizing data
x=a/max(a);
y=b/max(b);
z=c/max(c);
v=d/max(d);
% initializing iterations and choosing theta and alpha values 
size = 10;
m = length(y);
theta = [0 -1 1 1].';
iterations = 500;
alpha = 0.01;
mat = [ones(m,1) x z v];
%function for Gradient Descent and Cost Function
j=CalculatingCostReg3(mat,y,theta);
[theta_mat ,jValues] = CalculatingGradientDescentReg3(mat,y,theta,alpha,iterations);

thetaValues=[theta_mat jValues];
theta1 = thetaValues(:,1);
theta2 = thetaValues(:,2);
theta3 = thetaValues(:,3);
theta4 = thetaValues(:,4);

th1 =theta1(length(theta1))
th2 =theta2(length(theta2))
th3 =theta3(length(theta3))
th4 =theta4(length(theta4))

zt= th1 + (th2 *x)+ (th3 *z)+ (th4 *v);

h = 1 ./(1 + exp(-zt));
plot3(x,z,h);
hypothesis = h;
threshold1 = 0.5;
hypothesis(hypothesis>=threshold1) = 1;
hypothesis(hypothesis<threshold1) = 0;

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


