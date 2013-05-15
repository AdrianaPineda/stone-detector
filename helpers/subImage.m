function [ img ] = subImage(img,  xMin, yMin, xMax, yMax )
%SUBIMAGE Summary of this function goes here
%   Detailed explanation goes here

    img = img(yMin:yMax, xMin:xMax);

end

