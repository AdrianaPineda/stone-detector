function [ img ] = loadImageZapata(num)
%LOADRANDOMIMAGE Summary of this function goes here
%   Detailed explanation goes here
    
    img = imread(strcat('C:\Users\AdrianaPineda\Dropbox\Compartidas\Imagenes\Paciente 3 (Luz Marina Pinzon)\Luz Marina Pinzon (',num2str(num),').BMP'));
    
end

