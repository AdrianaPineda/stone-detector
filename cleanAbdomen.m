function [ imgOut ] = cleanAbdomen( imgIn, darkValue )
%UNTITLED6 Cleans the edges (dark area) of a CT abdomen image. The input
%image must be a grayscale image
%   Detailed explanation goes here

    
    paramX = 3;
    paramY = 7;
    numCount = 0;

    size_x = sizeX(imgIn);
    size_y = sizeY(imgIn);
    
    for x=1+paramX:size_x-paramX
        for y=1+paramY:size_y-paramY
            countUp     = 0;
            countDown   = 0;
            countLeft   = 0;
            countRight  = 0;
            
            for i=1:paramX
                if imgIn(y,x+i) < darkValue 
                    countUp = countUp +1;
                end
                if imgIn(y,x-i) < darkValue
                    countDown = countDown +1;
                end
            end
            for j=1:paramY
                if imgIn(y+j,x) < darkValue 
                    countLeft = countLeft +1;
                end
                if imgIn(y-j,x) < darkValue
                    countRight = countRight +1;
                end
            end
            if countUp > numCount && countDown > numCount
                imgIn(y,x) = 0;
            end
            if countLeft > numCount && countRight > numCount
                imgIn(y,x) = 0;
            end
            
            
        end
    end
    
    imgOut = imgIn;


end

