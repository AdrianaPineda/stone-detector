function [ changesB2I ] = showIntensityChanges( firstImage, nextImage, image_from_stoner, thickness, xStart, xEnd, yStart, yEnd, x_size, y_size)
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

for x=xStart:xEnd
      for y=yStart:yEnd
          if (image_from_stoner(y,x)>0 && image_from_stoner(y,x)<=(20/thickness))
              
              firstValue=int16(firstImage(y,x));
              nextValue=int16(nextImage(y,x));
              difference=abs(firstValue-nextValue);

              %
              % TODO:Como podemos mejorar el 55
              % Cómo poder saber si es un valor muy alto o muy bajo
              % TODO: Cambiar 205 por 'el valor del hueso'
             

              if (difference > 55 && (firstValue>=205 || nextValue>=205))        
                  changesB2I(y,x)=1;
              end  
          end
      end
end

end

