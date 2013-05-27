function [ pixel_x, pixel_y, image] = first_stone( image, size_x, size_y, fromV, toV )
%Finds the first stone
%   Detailed explanation goes here
pixel_x=-1;
pixel_y=-1;
flag=-1;

%Note: if its posible to find a white pixel near to a border (meaning it
%doesnt have a 8x8 neighborhood) then i and j must start at 8 and end 8
%pixels before the end
for i=fromV:size_x
    for j=toV:size_y
        if(image(j,i)==1)
            disp(i);
            disp(j);
            pixel_x=i;
            pixel_y=j;
            
            for a=i-8:i+8
                for b=j-8:j+8
                    image(b,a)=2;
                end
            end
            
            flag = 1;
            break;
        end      
    end
    if flag == 1
        break;
    end
end
end

