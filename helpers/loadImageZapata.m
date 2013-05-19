function [ img ] = loadImageZapata(num)
%LOADRANDOMIMAGE Summary of this function goes here
%   Detailed explanation goes here
    
    img = imread(strcat('C:\Users\AdrianaPineda\Documents\GitHub\stone-detector\Susana Zapata\Susana Zapata (',num2str(num),').BMP'));
    
end

