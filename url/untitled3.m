
k=40;
i=1;
label=[];
testnum=2;

while (i<testnum)
    if d1(ceil(k/2),i) < d2(ceil(k/2),i)
        label(i,:)=0;
%         scatter(d1,d2,[],"r","+","filled");
    else
        label(i,:)=1;
%         scatter(d1,d2,[],"g","*","filled");
    end
    i=i+1;
end

xlswrite('sort1.xlsx',test.labels,'sheet3','1A');
xlswrite('sort1.xlsx',label,'sheet3','1B');