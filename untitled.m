
k=[1,3,5,10,15,20,30,40,50,60,70,80,90,100];
i=1;
p=[];
label=[];
% correct=[0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% false0=[0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% false1=[0,0,0,0,0,0,0,0,0,0,0,0,0,0];
correct=[];
false0=[];
false1=[];

for i=1:14
    correct(i)=0;
    false0(i)=0;
    false1(i)=0;
end
maliciousdata=0;

testnum=5000; %用来测试的数据量
% while(i<testnum)
%     if test.labels(i,:)==1
%         maliciousdata=maliciousdata+1;
%     end
%     i=i+1;
% end

e=[];


for j=3:3
     for i=1:testnum
         e(i)=dist_benign(ceil(k(j)/2),i);
         %-dist_malicious(ceil(k(j)/2),i);
     end
    
    for i=1:testnum
        e=mapminmax(e, 0, 1);
    end

    i=1;
    while (i<testnum)
        if dist_benign(ceil(k(j)/2),i) < dist_malicious(ceil(k(j)/2),i)
            label(i,:)=0;
        else
            label(i,:)=1;
        end

        %判断结果与原值的差的绝对值
        p(i,:)=abs(label(i,:)-test.labels(i,:));

        if p(i,:)==0   %判断结果与原值相同
            correct(j)=correct(j)+1;
            if test.labels(i) == 0   %良性
                plot(i,e(i),'Marker','*','Color','b','MarkerSize',5);
                hold on;
            else  %恶性
                plot(i,e(i),'Marker','*','Color','r','MarkerSize',5);
                hold on;
            end
        else
            if test.labels(i,:)==0 && label(i,:)==1
                %原值为良性，判断成恶性
                false0(j)=false0(j)+1;
                plot(i,e(i),'Marker','+','Color','b','MarkerSize',5);
                hold on;
            else
                %原值为恶性，判断成良性
                false1(j)=false1(j)+1;
                plot(i,e(i),'Marker','+','Color','r','MarkerSize',5);
                hold on;
            end
        end

        i=i+1;
    end
end
    xlabel('点数');
    ylabel('相对距离');
    title('URL具体分布规律');
      legend('恶性url','良性url');