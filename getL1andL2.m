function [ l1, l2 ] = getL1andL2( input_Image )
%This function returns the vertical and horizontal distance of the
%abdominal cavity boundary

size_of_X=sizeX(input_Image);
size_of_Y=sizeY(input_Image);

found_in_X=false;
x_horizontal_f=0;
x_horizontal_s=0;

found_in_Y=false;
y_vertical_f=0;
y_vertical_s=0;

for i=1:size_of_X
    for j=1:size_of_Y
        if input_Image(i,j)~=0
           x_horizontal_f=i;
           found_in_X=true;
        end
        if found_in_X==true
            break;
        end
    end
end

found_in_X=false;
for i=1:size_of_X
    for j=1:size_of_Y
        temp=size_of_X-i+1;
        if input_Image(temp, j)~=0
           x_horizontal_s=temp;
           found_in_X=true;
        end
        if found_in_X==true
            break;
        end
    end
end


for j=1:size_of_Y
    for i=1:size_of_X
        if input_Image(i,j)~=0
           y_vertical_f=j;
           found_in_Y=true;
        end
        if found_in_Y==true
            break;
        end
    end
end

found_in_Y=false;
for j=1:size_of_Y
    for i=1:size_of_X
        temp=size_of_Y-j+1;
        if input_Image(i,temp)~=0
           y_vertical_s=temp;
           found_in_Y=true;
        end
        if found_in_Y==true
            break;
        end
    end
end

l2=abs(x_horizontal_s-x_horizontal_f);
l1=abs(y_vertical_s-y_vertical_f);


end

