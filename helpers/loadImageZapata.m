function [ img ] = loadImageZapata(num)
%LOADRANDOMIMAGE Summary of this function goes here
%   Detailed explanation goes here
    
    img = imread(strcat('/home/mono/matlab/stone-detector/Luz Marina Pinzon/Luz Marina Pinzon (',num2str(num),').BMP'));
    
end

