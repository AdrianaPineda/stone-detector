function [ img ] = cropBorders( img, xInit, xFin, yInit, yFin)
%UNTITLED9 sets the borders of a gray image image with color 0
%   Detailed explanation goes here

    size_y = sizeY(img);
    size_x = sizeX(img);
    %img = img(yInit:size_y-yFin,xInit:size_x-xFin);

    %left border
    for x=1:xInit
        for y=1:size_y
            img(y,x)=0;
        end
    end
    
    %upper border
    for x=1:size_x
        for y=1:yInit
            img(y,x)=0;
        end
    end
    
    %right border
    for x=1:xFin
        for y=1:size_y
            img(y,size_x+1-x)=0;
        end
    end
    
    %lower border
    for x=1:size_x
        for y=1:yFin
            img(size_y+1-y,x)=0;
        end
    end
    
end

 