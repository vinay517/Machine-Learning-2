function j= CalculatingCostr(mat,y,theta)
m=length(y);
h = 1./(1 + exp(-(mat* theta)));
j = -(1 /  m) * sum(y .* log(h) + (1 - y) .* log(1 - h)); 
end