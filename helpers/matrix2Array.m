function [ data ] = matrix2Array( img )
%MATRIX2ARRAY Summary of this function goes here
%   Detailed explanation goes here

    lenght = numel(img);
    data = zeros(lenght,1);
    
    count = 1;
    for x=1:sizeX(img)
        for y=1:sizeY(img)
            data(count) = img(y,x);
            count = count + 1;
        end
    end

end

