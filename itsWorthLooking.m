function [ result ] = itsWorthLooking( inputImage, size_x, size_y)
%Checks if a white pixel can be considered a stone

%Creates a matrix that will contain white pixels NOT corresponding to a
%stone
original=zeros(size_x, size_y);

for i=20:500
    for j=20:500
        leftPixels=i-8;
        rightPixels=i+8;
        upPixels=j-8;
        downPixels=j+8;
        countWhite=0;
        if(inputImage(j,i)>=1)
        for k=leftPixels:rightPixels
            for l=upPixels:downPixels
              if(inputImage(l,k)>=1)
                  countWhite=countWhite+1;
              end
            end
        end
        if (countWhite>=15)
            original(j,i)=1;
        end
        end
    end
end

for i=1:size_x
    for j=1:size_y
        if(inputImage(j,i)>0)
            inputImage(j,i)=1;
        end
    end
end
result=(inputImage-original);

end

