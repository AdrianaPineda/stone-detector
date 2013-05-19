function [ res ] = testFernando(  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

res = -1;
for i=97:160
    
    img = stoneDetector(i);
    img = img/255;
    if res == -1
        res = img;
    else
        res = res + img;
    end
    
end

res = res - 1;


imshow(res*20);



end

