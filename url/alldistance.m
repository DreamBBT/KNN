
d1=[];
d2=[];
test.data=[];
test.labels=[];
i=1;
testnum=2;

while(i<testnum)
    test.data=[test.data;Day119.data(i,FeatureTypes)];
    test.labels=[test.labels;Day119.labels(i,1)];

    for j=1:1000
        d1(j,i)=distance(test.data(i,:),train1.data(j,:));
        d2(j,i)=distance(test.data(i,:),train2.data(j,:));
    end

%     d1(:,i)=sort(d1(:,i));
%     d2(:,i)=sort(d2(:,i));
%x=linspace(1,1000,1000);

    
    
%scatter(d1,d2,[]);
%scatter(x,d1(j,i),[],"g","filled","*");
    i=i+1;
end
xlswrite('test3.xlsx',test.data);
xlswrite('sort1.xlsx',d1,'sheet1');
xlswrite('sort1.xlsx',d2,'sheet2');


