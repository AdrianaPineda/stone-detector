function [ img ] = loadImagePinzon(num)
%LOADRANDOMIMAGE Summary of this function goes here
%   Detailed explanation goes here
    
    img = imread(strcat('/home/mono/matlab/stone-detector/Susana Zapata/Susana Zapata (',num2str(num),').BMP'));
    
end

