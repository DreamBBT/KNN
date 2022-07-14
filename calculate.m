
k=[1,3,5,10,15,20,30,40,50,60,70,80,90,100];
i=1;
p=[];
label=[];
correct=[];
false0=[];
false1=[];
testnumber=[];
testnumber=[2000,3000,5000,8000,10000];


for x=1:5
    %maliciousdata=0;
    testnum=testnumber(x); %用来测试的数据量
    % while(i<testnum)
    %     if test.labels(i,:)==1
    %         maliciousdata=maliciousdata+1;
    %     end
    %     i=i+1;
    % end
    for i=1:14
        correct(i)=0;
        false0(i)=0;
        false1(i)=0;
    end
    for j=1:14
        i=1;
        while (i<=testnum)
            if dist_benign(ceil(k(j)/2),i) < dist_malicious(ceil(k(j)/2),i)
                label(i,:)=0;
            else
                label(i,:)=1;
            end
            
            %判断结果与原值的差的绝对值
            p(i,:)=abs(label(i,:)-test.labels(i,:));
            
            if p(i,:)==0 %判断结果与原值相同
                correct(j)=correct(j)+1;
            else
                if test.labels(i,:)==0 && label(i,:)==1
                    %原值为良性，判断成恶性
                    false0(j)=false0(j)+1;
                else
                    %原值为恶性，判断成良性
                    false1(j)=false1(j)+1;
                end
            end
            
            i=i+1;
        end
        

        plot(k(j),correct(j)/testnum,'*r');
         hold on;
        if j>1          
            if x==1
            plot([k(j-1),k(j)],[correct(j-1)/testnum,correct(j)/testnum],'Color','g');
            hold on;
            end
            if x==2
            plot([k(j-1),k(j)],[correct(j-1)/testnum,correct(j)/testnum],'Color','c');
            hold on;
            end
            if x==3
            plot([k(j-1),k(j)],[correct(j-1)/testnum,correct(j)/testnum],'Color','b');
            hold on;
            end
            if x==4
            plot([k(j-1),k(j)],[correct(j-1)/testnum,correct(j)/testnum],'Color','m');
            hold on;
            end
            if x==5
            plot([k(j-1),k(j)],[correct(j-1)/testnum,correct(j)/testnum],'Color','r');
            hold on;
            end
            
        end
       
        %     xlswrite(['k_',num2str(k(j)),'.xlsx'],test.labels,'sheet1','1A');
        %     xlswrite(['k_',num2str(k(j)),'.xlsx'],label,'sheet1','1B');
        %     xlswrite(['k_',num2str(k(j)),'.xlsx'],p,'sheet1','1C');
        %
        %     xlswrite(['k_',num2str(testnum-1),'.xlsx'],k(j),'sheet2',[num2str(j),'A']);
        %     xlswrite(['k_',num2str(testnum-1),'.xlsx'],correct(j)/testnum,'sheet2',[num2str(j),'B']);
        %     xlswrite(['k_',num2str(testnum-1),'.xlsx'],false0(j)/testnum,'sheet2',[num2str(j),'C']);
        %     xlswrite(['k_',num2str(testnum-1),'.xlsx'],false1(j)/testnum,'sheet2',[num2str(j),'D']);
        
    end
end
 legend('1000','2000','3000','4000','5000');
         ylabel('正确率');
        xlabel('k值');
        title('正确率随K值的变化情况');
        axis([0,100,0.7,1.0]);
      




