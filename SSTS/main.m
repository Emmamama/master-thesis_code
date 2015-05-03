function p=main(sequence,w,f)
p={};
sub=SubsequenceExtranction(sequence,w,f);
c={};
error=0;
while error ~= inf
    [c1,s1,error1]=CreateCluster(c,sub);
    [c2,s2,error2]=UpdateCluster(c,sub);
    [c3,s3,error3]=MergeCluster(c,sub);
    if error1<=error2 && error1<=error3
        c=c1;
        sub=s1;
        error=error1;
    else
        if error2<=error1 && error2<=error3
            c=c2;
            sub=s2;
            error=error2;
        else
            if error3<=error1 && error3<=error2
                c=c3;
                sub=s3;
                error=error3;
            end
        end
    end
    p{end+1}=c;
end
end
