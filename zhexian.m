a1=[];
a2=[];
a3=[];
a4=[];
a1 = xlsread('k=5.xlsx','Sheet1','A2:A15');
a2 = xlsread('k=5.xlsx','Sheet1','B2:B15');
a3 = xlsread('k=5.xlsx','Sheet1','C2:C15');
a4 = xlsread('k=5.xlsx','Sheet1','D2:D15');
plot(a1,a2,'-ro',a1,a3,'-b+',a1,a4,'-kx');
hold on
xlabel('数据量'); 
ylabel('概率');
title('K=5数量测试')
legend('正确率','检测率','误报率'); %图例的设置



