function [res] = stoner(index_start, index_final)

clc;

res = -1;
for i=index_start:index_final
    
    img = boneIntensityMap(i);
    
    if res == -1
        res = img;
    else
        res = res + img;
    end
    
end

res = max(res - 1,0);
