function [ img ] = loadImageZapata(num)
%Loads image from pacient Zapata, Susana
    
img = imread(strcat('C:\Users\AdrianaPineda\Documents\GitHub\stone-detector\Susana Zapata\Susana Zapata (',num2str(num),').BMP'));
    
end

