k=[1,3,5,10,15,20,30,40,50,60,70,80,90,100];
i=1;
p=[];
label=[];
correct=[];
false0=[];
false1=[];
result=[];
for i=1:14
    correct(i)=0;
    false0(i)=0;
    false1(i)=0;
end
maliciousdata=0;
testnum=5001; %用来测试的数据量
while(i<testnum)
    result(i)=test.labels(i);
    if test.labels(i)==1
        %test.labels(i,:)==1
        maliciousdata=maliciousdata+1;
    end
    i=i+1;
end
for j=3:3
    i=1;
    while (i<testnum)
        if dist_benign(ceil(k(j)/2),i) < dist_malicious(ceil(k(j)/2),i)
           % label(i,:)=0;
            label(i)=0;
        else
            %label(i,:)=1;
            label(i)=1;
        end
%         %判断结果与原值的差的绝对值
%         p(i,:)=abs(label(i,:)-test.labels(i,:));
%         if p(i,:)==0 %判断结果与原值相同
%             correct(j)=correct(j)+1;
%         else
%             if test.labels(i,:)==0 && label(i,:)==1
%                 %原值为良性，判断成恶性
%                 false0(j)=false0(j)+1;
%             else
%                 %原值为恶性，判断成良性
%                 false1(j)=false1(j)+1;
%             end
%         end
        i=i+1;
    end
end


result1=plotroc(result,e);
disp(result1);