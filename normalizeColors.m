function [ img ] = normalizeColors( img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    for x=1:sizeX(img)
        for y=1:sizeY(img)
            if img(y,x)==191
                img(y,x)=255;
            else
                img(y,x)=0;
            end
        end
    end
            
    eroded = imerode(img, strel('disk',1));
    dilated = imdilate(eroded, strel('disk',5));
    
    img=min(dilated, img);
    
end

