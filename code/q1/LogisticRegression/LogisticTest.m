x = fluML(201:352,14)
y = fluML(201:352,10)

m=length(y);
th1 =theta1(length(theta1))
th2 =theta2(length(theta2))
zt= th1 + (th2 *x);
h = 1 ./(1 + exp(-zt));
j = -(1 /  m) * sum(y .* log(h) + (1 - y) .* log(1 - h)); 
figure;
plot(x,h);
xlabel('x');
ylabel('h');
title('test graph for hypothesis');
hypothesisTest = h;
threshold1 = 0.2;
hypothesisTest(hypothesisTest>=threshold1) = 1;
hypothesisTest(hypothesisTest<threshold1) = 0;
confusion_matrixTest = string(zeros(length(hypothesisTest),1));
for i=1:length(hypothesisTest)
    if(hypothesisTest(i)==0 && y(i) == 0)
       confusion_matrixTest(i) = "tp";

    elseif(hypothesisTest(i) ==0 && y(i) == 1)
        confusion_matrixTest(i) = "fp";
    
    elseif(hypothesisTest(i) ==1 && y(i) == 0)
        confusion_matrixTest(i) = "fn";

    else
        confusion_matrixTest(i) = "tn";

        end

end
    
b=count(confusion_matrixTest,"tp");
tp=sum(b)
c=count(confusion_matrixTest,"tn");
tn=sum(c)
d=count(confusion_matrixTest,"fp");
fp=sum(d)
e=count(confusion_matrixTest,"fn");
fn=sum(e)

precision = tp/(tp+fp)
recall = tp/(tp+fn)
f1accuracy=2*(precision*recall)/(precision + recall)

    

