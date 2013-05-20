function [ img ] = loadImageAcevedo(num)
%Loads image from pacient Acevedo, Harley
    
img = imread(strcat('C:\Users\AdrianaPineda\Documents\GitHub\stone-detector\Harley Acevedo\Harley Acevedo (',num2str(num),').BMP'));
    
end

