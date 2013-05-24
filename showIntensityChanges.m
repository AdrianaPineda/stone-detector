function [ changesB2I ] = showIntensityChanges( firstImage, nextImage, image_from_stoner, thickness, x_size, y_size, up)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%firstImage = cleanAbdomen(firstImage,5);

%Changes between two images
changesB2I=zeros(x_size,y_size);

%sets outer borders in black
%firstImage = cropBorders(firstImage, 6,6,6,6);

%Finds edges of the image
%[x1, x2, y1, y2]=findEdges(firstImage);
%[xStart, xEnd, yStart, yEnd]=range_a_b(up, x1, x2, y1, y2, sizeX(firstImage), sizeY(firstImage));

for x=1:x_size
      for y=1:y_size
          if (image_from_stoner(y,x)>0 && image_from_stoner(y,x)<=(20/thickness))
              
              firstValue=int16(firstImage(y,x));
              nextValue=int16(nextImage(y,x));
              difference=abs(firstValue-nextValue);

              %
              % TODO:Como podemos mejorar el 55
              % CÃ³mo poder saber si es un valor muy alto o muy bajo
              % TODO: Cambiar 205 por 'el valor del hueso'
              % TODO: limitar el 'x' y el 'y'. Propongo lo siguiente: el x
              % que vaya desde 0.15-0.85 (o 0.15-0.9) de L1 (ya tenemos la
              % la función para hayar L1). Para el 'y' sería de 0.15-0.65
              % de L2
              % :)

              if (difference > 55 && (firstValue>=205 || nextValue>=205))        
                  changesB2I(y,x)=1;
              end  
          end
      end
end

end

