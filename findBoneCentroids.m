function [ centroids ] = findBoneCentroids( bones_img, num_centroids )
%FINDBONECENTROIDS Summary of this function goes here
%   Detailed explanation goes here
    
    lenght = numel(bones_img);
    data = zeros(lenght,2);
    
    count = 1;
    for x=1:sizeX(bones_img)
        for y=1:sizeY(bones_img)
            if bones_img(y,x)>0
                data(count,1)=x;
                data(count,2)=y;
            end
        end
    end
    
    centroids = bones_img;
    disp(bones_img);
    
    cont = true;
    while cont
        try
            [idx,c] = kmeans(data,num_centroids);
            cont = false;
        catch 
            cont = true;
            disp('kmeans failed, but don`t worry, we will retry');
        end 
    end
    
    disp(c);
    
    
end

