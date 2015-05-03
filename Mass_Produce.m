%function [mass_length,mass_height]=Mass_Produce(data)
%mass_length=[];
%mass_height=[];
%for i=201:276
%    value=Data_Extraction(data,i);
%    [length,height]=Character_Extraction(value);
%    mass_length=[mass_length;length'];
%    mass_height=[mass_height;height'];
%end
%end

function [mass_length,mass_height,h,t,z,T,x,I,RMSSTD,RS,SD]=Mass_Produce(data)
mass_length=[];
mass_height=[];
x=0;
for i=201:276
    value=Data_Extraction(data,i);
    [length,height]=Character_Extraction(value);
    if size(height,1)~=3
        x=size(height,1);
    else
    mass_length=[mass_length;length'];
    mass_height=[mass_height;height'];
    end
end
[RMSSTD,RS,SD]=Criterion(mass_height);


[yc,z,h,t]=clustering_draw(mass_height);
I = inconsistent(z);
T=cluster(z,'maxclust',5);
end