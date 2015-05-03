function p=RMSSTD(data)
M=30;
p=zeros(M,1);
q=zscore(data);
for N=1:30
    y=pdist(q,'Euclid');%º∆À„≈∑ œæ‡¿Î
	z=linkage(y,'average');
    T=cluster(z,'maxclust',N);
    er=0.0;
    length=0;
    tmp=zeros(size(unique(T),1),1);
    for i=1:size(unique(T),1)
        x(i).content={};
        x(i).aver=zeros(1,size(data(1,:),2));
        x(i).num=0;
        for j=1:size(data,1)
            if T(j)==i
                x(i).content{end+1}=data(j,:);
                x(i).aver=x(i).aver+data(j,:);
                x(i).num=x(i).num+1;
            end
        end
        x(i).aver=x(i).aver/x(i).num;
        for j=1:x(i).num
            tmp(i)=tmp(i)+norm(x(i).content{j}-x(i).aver,2);
        end 
        er=er+tmp(i);
        length=length+x(i).num-1;
    end
    p(N)=sqrt(er/length);
end
end

    
    
    


