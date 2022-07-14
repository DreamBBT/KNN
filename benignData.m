i=1;
j=1;
train1.data=[];
train1.labels=[];
while( j <= 1000 )
    if Day120.labels(i) == 0
        train1.data=[train1.data;Day120.data(i,FeatureTypes)];
        train1.labels=[train1.labels;Day120.labels(i,1)];
        i=i+1;
        j=j+1;
    else
        while(Day120.labels(i) == 1)
            i=i+1;
        end
    end
end

xlswrite('BenignData.xlsx',train1.data);

   