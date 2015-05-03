function [RMSSTD,RS,SD]=Criterion(data)

M=30;
RMSSTD=zeros(M,1);
RS=zeros(M,1);
a=1;
SD=zeros(M,1);

q=zscore(data);
aver=zeros(1,size(q,2));
for i=1:size(q,1)
    aver=aver+q(i,:);
end
aver=aver/size(q,1);
Error=0.0;
for i=1:size(q,1)
    Error=Error+norm(q(i,:)-aver,2);
end

for N=1:M
    y=pdist(q,'Euclid');%¼ÆËãÅ·ÊÏ¾àÀë
	z=linkage(y,'average');
    T=cluster(z,'maxclust',N);
    er=0.0;
    length=0;
    tmp=zeros(size(unique(T),1),1);
    tt=zeros(size(unique(T),1),1);
    ssigma=0.0;
    for i=1:size(unique(T),1)
        x(i).content={};
        x(i).aver=zeros(1,size(q,2));
        x(i).num=0;
        for j=1:size(q,1)
            if T(j)==i
                x(i).content{end+1}=q(j,:);
                x(i).aver=x(i).aver+q(j,:);
                x(i).num=x(i).num+1;
            end
        end
        x(i).aver=x(i).aver/x(i).num;
        for j=1:x(i).num
            tmp(i)=tmp(i)+norm(x(i).content{j}-x(i).aver,2);
            tt(i)=tt(i)+norm(x(i).content{j}-x(i).aver,2)/x(i).num;
        end 
        er=er+tmp(i);
        ssigma=ssigma+tt(i)/size(unique(T),1);
        length=length+x(i).num-1;
    end
    RMSSTD(N)=sqrt(er/length);
    RS(N)=(Error-er)/Error;
    
    
    disk=0.0;
    tttt=zeros(size(unique(T),1),1);
    for i=1:size(unique(T),1)
        for j=1:size(unique(T),1)
            tttt(i)=tttt(i)+norm((x(i).aver-x(j).aver),2);
        end
        disk=disk+1/tttt(i);
    end
%    if N==M
%        a=disk;
%    end
    
    vmax=-inf;
    vmin=inf;
    for i=1:size(unique(T),1)
        for j=1:size(unique(T),1)
            if(norm(x(i).aver-x(j).aver,2)>vmax)
                vmax=norm(x(i).aver-x(j).aver,2);
            end
            if(i~=j && norm(x(i).aver-x(j).aver,2)<vmin)
                vmin=norm(x(i).aver-x(j).aver,2);
            end
        end
    end 
    SD(N,2)=vmax/vmin*disk;
    SD(N,1)=ssigma/(Error/(size(q,1)));
    SD(N,3)=vmax/vmin*disk*(ssigma/(Error/(size(q,1)))+1);
%    SD(N)=vmax/vmin*(disk+a*ssigma/(Error/(size(q,1))));
end
end

    
    
    


