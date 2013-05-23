function [ img ] = loadImageZapata(num)
%Loads image from pacient Zapata, Susana
    
    img = imread(strcat('/home/mono/matlab/stone-detector/Luz Marina Pinzon/Luz Marina Pinzon (',num2str(num),').BMP'));

    
end

