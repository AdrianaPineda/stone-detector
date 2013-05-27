function [ ] = draw_square( image_with_stones, numPacient, size_x, size_y, directory)
%This function draws a square where there is a stone

[index_iS, index_iF, firstImageLoaded, up] = which_pacient( numPacient );
[stoneFound_x, stoneFound_y, image_with_stones]=first_stone(image_with_stones, size_x, size_y,1,1);
iterator=1;
while stoneFound_x~=-1 && stoneFound_y~=-1
    for i=index_iS:index_iF
       if(i==index_iS)
           current_image=firstImageLoaded;
       else
           current_image=getImagefromPacient(numPacient, i, directory);
       end
       
       %TODO: 205 sigue sin mejorar
       if(current_image(stoneFound_y,stoneFound_x)>205)
           %Draw square                      
           for a=stoneFound_x-10:stoneFound_x+10
             current_image(stoneFound_y-10,a)=255;  
             current_image(stoneFound_y+10,a)=255;
           end
           
           for b=stoneFound_y-10:stoneFound_y+10
             current_image(b,stoneFound_x+10)=255;  
             current_image(b,stoneFound_x-10)=255;
           end
           
           %Saves image
           %filename = sprintf('C:\Users\AdrianaPineda\Documents\GitHub\stone-detector\result_image_%d.bmp', iterator);
           imwrite(current_image, strcat(directory, '\results',num2str(iterator), '.bmp' ), 'bmp')
           iterator=iterator+1;
       end  
    end 
    
    if(stoneFound_y+8>size_y)
        [stoneFound_x, stoneFound_y, image_with_stones]=first_stone(image_with_stones, size_x, size_y, stoneFound_x+1, size_y);
    else
        [stoneFound_x, stoneFound_y, image_with_stones]=first_stone(image_with_stones, size_x, size_y, stoneFound_x, stoneFound_y+8);
    end
end
end

