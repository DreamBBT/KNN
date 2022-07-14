dist_benign=[];
dist_malicious=[];
test.data=[];
test.labels=[];




datanum=5001;
i=1;
while(i<datanum)
    test.data=[test.data;Day119.data(i,FeatureTypes)];
    test.labels=[test.labels;Day119.labels(i,1)];

    for j=1:1000
        dist_benign(j,i)=distance(test.data(i,:),train1.data(j,:));
        dist_malicious(j,i)=distance(test.data(i,:),train2.data(j,:));
    end

    dist_benign(:,i)=sort(dist_benign(:,i));
    dist_malicious(:,i)=sort(dist_malicious(:,i));

    i=i+1;
end

% xlswrite(['data_',num2str(datanum-1),'.xlsx'],dist_benign,'sheet1');
% xlswrite(['data_',num2str(datanum-1),'.xlsx'],dist_malicious,'sheet2');
