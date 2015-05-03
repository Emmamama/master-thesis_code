function result=MK_Test()
outcome=xlsread('outcome-unit-month-notitle.xlsx');
income=xlsread('income-unit-month-notitle.xlsx');
data=[income,outcome(:,4:11)];
result=ones(76*17,1);
for i=4:20
    for j=201:276
        values=[];
        for k=1:8027
            if data(k,3)==j
                values=[values;data(k,i)];
            end
        end
        result((i-4)*76+j-200)=MK(values);
    end
end
plot(result,'*');
hold on;
line([1,1292],[1.28,1.28],'color','k','LineStyle','--');
hold on;
line([1,1292],[1.64,1.64],'color','k','LineStyle',':');
hold on;
line([1,1292],[2.32,2.32],'color','k','LineStyle','-.');
hold on;
line([1,1292],[-1.28,-1.28],'color','k','LineStyle','--');
hold on;
line([1,1292],[-1.64,-1.64],'color','k','LineStyle',':');
hold on;
line([1,1292],[-2.32,-2.32],'color','k','LineStyle','-.');
end
            
            
