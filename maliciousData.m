i=1;
j=1;
train2.data=[];
train2.labels=[];
while( j <= 1000 )
    if Day120.labels(i) == 1
        train2.data=[train2.data;Day120.data(i,FeatureTypes)];
        train2.labels=[train2.labels;Day120.labels(i,1)];
        i=i+1;
        j=j+1;
    else
        while(Day120.labels(i) == 0)
            i=i+1;
        end
    end
end

xlswrite('MaliciousData.xlsx',train2.data);

   