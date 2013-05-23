function [  ] = itsWorthLooking( inputImage )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%Second option
%Obtaining the number of vertical and horizontal pixels of the input
%image
xS=sizeX(inputImage);
yS=sizeY(inputImage);

original=zeros(xS, yS);
resultFernando=testFernando;

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
        if (countWhite>=10 || (resultFernando(j,i)>3 || resultFernando(j,i)==0))
            original(j,i)=1;
        end
        end
    end
end

imshow(inputImage-original);

end

