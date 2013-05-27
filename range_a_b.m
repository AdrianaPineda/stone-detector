function [ xStart, xEnd, yStart, yEnd ] = range_a_b( up, x1, x2, y1, y2, size_of_x, size_of_y )
%Returns the edges of the reion of interest
left=x1;
right=size_of_x-x2;

upV=y1;
down=size_of_y-y2;

l1=right-left;
l2=down-upV;

xStart=int16(0.15*l1)+left;
xEnd=int16(0.85*l1)+left;

if up
    yStart=int16(0.25*l2)+upV;
    yEnd=int16(0.65*l2)+upV;
else
    yStart=down-int16(0.25*l2);
    yEnd=down-int16(0.65*l2);
end


end

