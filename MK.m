function result=MK(data)
n=size(data,1);
result=0;
tmpt=power(n*(n-1)*(2*n+5)/18,0.5);
for i=1:(n-1)
    for j=(i+1):n
        if data(j,1)>data(i,1)
            result=result+1;
        else
            if data(j,1)<data(i,1)
                result=result-1;
            end
        end
    end
end
result=result/tmpt;
end