function sum(data)
for i=1:8027
data(i,4)=0.0;
for j=5:11
data(i,4)=data(i,4)+data(i,j);
end
end