function [ img ] = loadImagePinzon(num)
%Loads image from pacient Pinzon, Luz Marina
    
img = imread(strcat('C:\Users\AdrianaPineda\Documents\GitHub\stone-detector\Luz Marina Pinzon\Luz Marina Pinzon (',num2str(num),').BMP'));
    
end

