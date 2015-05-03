function [c,sub,error]=CreateCluster(c,sub)
error=inf;
if(size(sub,2)>2)
    %find motif x y and cluster the two.
    [first,second]=MKMotif(sub);
    nc.aver=(sub(first).content+sub(second).content)/2;
    nc.member={sub(first) sub(second)};
    nc.error=norm(sub(first).content-nc.aver,2)+norm(sub(second).content-nc.aver,2);
    c{end+1}=nc;
    error=nc.error;
    %erase elements that contain x or y   %
    aa=sub(first).start;
    bb=sub(first).end;
    cc=sub(second).start;
    dd=sub(second).end;
    sub=sub(([sub.start]>aa | [sub.end]<bb)& ([sub.start]>cc | [sub.end]<dd));
end
end









