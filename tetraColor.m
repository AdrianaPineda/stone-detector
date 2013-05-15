function [ img_res ] = tetraColor( img )
%TETRACOLOR Summary of this function goes here
%   Detailed explanation goes here

    img_res = img;
    [a,colors] = findpeaks(imhist(img,256/4),'minpeakdistance',10);
    colors = colors*4;
    disp(colors);
    for x=1:sizeX(img)
        for y=1:sizeY(img)
            
            val = img(y, x);
            menor = 256; 
            pos = 0;
            
            for i=1:4
                if abs(val - colors(i)) < menor
                    menor = val;
                    pos = i;
                end
            end
            img_res(y,x)=pos-1;
            
        end
    end
    
end

