function [ x1, x2, y1, y2 ] = findEdges( img )
%findEdges finds the edges of an image and returns the points as x1 x2 y1
%y2
%   The located points correspond to the center top, center bottom, center
%   left and center right pixels

    value = 20;

    x1 = 0;
    x2 = 0;
    y1 = 0;
    y2 = 0;
    
    
    size_x = sizeX(img);
    size_y = sizeY(img);
    
    % find the lower x bound
    for x=1:size_x
        val = mean(img(:,x));
        if val>value
            x1 = x;
            break;
        end
    end
    
    % find the higher x bound
    for x=1:size_x
        val = mean(img(:,size_x-x));
        if val>value
            x2 = x;
            break;
        end
    end
    
    % find the upper y bound
    for y=1:size_y
        val = mean(img(y,:));
        if val>value
            y1 = y;
            break;
        end
    end
    
     % find the higher y bound
    for y=1:size_y
        val = mean(img(size_y-y,:));
        if val>value
            y2 = y;
            break;
        end
    end
    
    

end

