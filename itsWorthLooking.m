function [  ] = itsWorthLooking( inputImage )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

outputImage=edge(inputImage);

BW2 = bwareaopen(outputImage, 20)
result=outputImage-BW2;
imshow(result);

%First Option
holesFilling=imdilate(inputImage, strel('square',4));
holesFilling2=imerode(holesFilling, strel('square',6));
holesFilling3=imdilate(holesFilling2, strel('square',6));
imshow(holesFilling3);
imshow(inputImage-holesFilling3);

%Second option
sizeIn=size(inputImage);

%Obtaining the number of vertical and horizontal pixels of the input
%image
xS=sizeIn(1);
yS=sizeIn(2);

original=zeros(xS, yS);

for i=20:500
    for j=20:500
        leftPixels=i-8;
        rightPixels=i+8;
        upPixels=j-8;
        downPixels=j+8;
        countWhite=0;
        if(inputImage(j,i)==1)
        
        for k=leftPixels:rightPixels
            for l=upPixels:downPixels
              if(inputImage(l,k)==1)
                  countWhite=countWhite+1;
              end
            end
        end
        if countWhite>=15
            original(j,i)=1;
        end
        end
    end
end

imshow(inputImage-original);

end

