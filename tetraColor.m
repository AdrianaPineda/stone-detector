function [ img_res ] = tetraColor( img )
%TETRACOLOR Summary of this function goes here
%   Detailed explanation goes here

    % specify the number of different clusteres
    clusteres = 4;

    data = matrix2Array(img);
    
    cont = true;
    while cont
        try
            kmeans_data = kmeans(data,clusteres,'start',[0;40;110;255]);
            cont = false;
        catch 
            cont = true;
            disp('kmeans failed, but don`t worry, we will retry');
        end 
    end
    
    
    count = 1;
    for x=1:sizeX(img)
        for y=1:sizeY(img)
            img(y,x) = kmeans_data(count);
            count = count + 1;
        end
    end
    
    img_res = img*(255/clusteres);
    
end

