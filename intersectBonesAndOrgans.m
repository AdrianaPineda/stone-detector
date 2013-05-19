function [ bones_and_organs ] = intersectBonesAndOrgans( onlyBones, onlyOrgans )
%INTERSECTBONESANDORGANS Summary of this function goes here
%   Detailed explanation goes here

    suma = onlyOrgans;
    conectivity_lenght = 1;
    
    size_x = sizeX(onlyBones);
    size_y = sizeY(onlyBones);
    bones_and_organs = onlyBones;
    
    for x=conectivity_lenght+1:size_x-conectivity_lenght
        for y=conectivity_lenght+1:size_y-conectivity_lenght
            valBones = onlyBones(y,x);
            if valBones>0
                if suma(y+conectivity_lenght,x)==255 || suma(y-conectivity_lenght,x)==255 || suma(y,x+conectivity_lenght)==255 || suma(y,x-conectivity_lenght)==255
                    bones_and_organs(y,x) = 255;
                else
                    bones_and_organs(y,x) = 0;
                end
                
            end
        end
    end
    
    bones_and_organs = cropBorders(bones_and_organs, conectivity_lenght, conectivity_lenght, conectivity_lenght, conectivity_lenght);
    
    bones_and_organs = imdilate(bones_and_organs, strel('disk',10));
    bones_and_organs = min(onlyBones, bones_and_organs);

end

