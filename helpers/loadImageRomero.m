function [ img ] = loadImageRomero(num)
%Loads image from pacient Romero, John
    
img = imread(strcat('C:\Users\AdrianaPineda\Documents\GitHub\stone-detector\John Romero\John Romero (',num2str(num),').BMP'));
    
end

