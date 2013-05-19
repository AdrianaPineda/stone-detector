function [ img ] = getBones( img )
%UNTITLED this functions filters out the image background, the bones and
%the skin and fat leaving only "organ color" or organ tissue
%   Detailed explanation goes here
    
    for x=1:sizeX(img)
        for y=1:sizeY(img)
            if img(y,x)>180
                img(y,x)=255;
            else
                img(y,x)=0;
            end
        end
    end
            
    %temp = imerode(img, strel('square',2));
    %img = imdilate(img, strel('disk',1));
    
    
    
    %img=min(dilated, img);
    
end

