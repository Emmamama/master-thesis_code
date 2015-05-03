%function z=clustering_draw(mass_height)
%A=zscore(mass_height);
%y=pdist(A,'Euclid');%����ŷ�Ͼ���
%yc=squareform(y);
%z=linkage(y);
%[h,t]=dendrogram(z);%���ӻ�������

function [yc,z,h,t]=clustering_draw(A)
A=zscore(A);
y=pdist(A,'Euclid');%����ŷ�Ͼ���
yc=squareform(y);
z=linkage(y,'average');
[h,t]=dendrogram(z,0);%���ӻ�������

