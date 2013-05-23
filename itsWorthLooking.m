function [ result ] = itsWorthLooking( inputImage, x, y, index_iS, index_iF )

%Checks if a white pixel can be considered a stone

%Creates a matrix that will contain white pixels NOT corresponding to a
%stone
original=zeros(x, y);
resultFernando=testFernando(index_iS, index_iF);

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

        if (countWhite>=10 || resultFernando(j,i)>5 || resultFernando(j,i)==0)
            original(j,i)=1;
        end
        end
    end
end

result=(inputImage-original);

end

