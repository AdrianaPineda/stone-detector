res = -1;
for i=269:280
    
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