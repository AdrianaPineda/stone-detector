function [ img ] = getOrgans( img )
%UNTITLED this functions filters out the image background, the bones and
%the skin and fat leaving only "organ color" or organ tissue
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
            
    temp = imerode(img, strel('disk',2));
    temp = imdilate(temp, strel('disk',8));
    
    img=min(temp, img);
    
end

