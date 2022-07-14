function dist = distance(x,y)
dist = 0;
for i=1:64
    dist = dist+(x(i)-y(i))^2;
end
dist = sqrt(dist);
end