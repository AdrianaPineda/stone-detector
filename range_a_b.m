function [ xStart, xEnd, yStart, yEnd ] = range_a_b( up, x1, x2, y1, y2, size_of_x, size_of_y )
%Returns the range for iterator b

left=x1;
right=size_of_x-x2;

upV=y1;
down=size_of_y-y2;

l1=right-left;
l2=down-upV;

xStart=uint8(0.15*l1)+left;
xEnd=uint8(0.85*l1)+left;

if up
    yStart=uint8(0.1*l2)+upV;
    yEnd=uint8(0.45*l2)+upV;
else
    yStart=uint8(0.4*l2)+upV;
    yEnd=uint8(0.8*l2)+upV;
end


end

