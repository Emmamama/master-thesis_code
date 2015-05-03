%{This function extracts the data of a specific school from the original data set}
%{The parameter is the id of the school}
%{The function requires the original data to be denoted as "data"}
function values=Data_Extraction(data,id)
values=[];
r=-1;
for i=1:8027
    if (data(i,3)==id)
        values=[values;data(i,4)];
        r=r+1;
    end
end
end



        
    
