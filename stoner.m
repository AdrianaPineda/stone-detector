clc;
res = -1;
for i=241:300
    
    img = boneIntensityMap(i);
    
    if res == -1
        res = img;
    else
        res = res + img;
    end
    
end

res = max(res - 1,0);

imshow(res*20);