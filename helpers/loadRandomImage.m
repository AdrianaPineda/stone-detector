function [ img ] = loadRandomImage()
%LOADRANDOMIMAGE Summary of this function goes here
%   Detailed explanation goes here

    if rand>0.5
        rand_num = int16(rand*(300-230)) + 230;
        img = imread(strcat('/home/mono/matlab/stone-detector/Luz Marina Pinzon/Luz Marina Pinzon (',num2str(rand_num),').BMP'));
        disp(strcat('Loading image from patient Luz Maria: ',num2str(rand_num)));
    else
        rand_num = int16(rand*(300-241)) + 241;
        img = imread(strcat('/home/mono/matlab/stone-detector/Susana Zapata/Susana Zapata (',num2str(rand_num),').BMP'));
        disp(strcat('Loading image from patient Susana Zapata: ',num2str(rand_num)));
    end

end

