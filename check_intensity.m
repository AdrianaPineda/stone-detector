function [ changesB2I ] = check_intensity( firstImage, nextImage, x, y, up)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Changes between two images
changesB2I=zeros(x,y);

%Finds edges of the image
[x1, x2, y1, y2]=findEdges(firstImage);

[aStart, aEnd, bStart, bEnd]=range_a_b(up, x1, x2, y1, y2, sizeX(firstImage), sizeY(firstImage));

for a=aStart:aEnd
      for b=bStart:bEnd
          firstValueL=int16(firstImage(b,a));
          nextValueL=int16(nextImage(b,a));
          minusOL=firstValueL-nextValueL;
          if (abs(minusOL) > 55 && (firstValueL>=205|| nextValueL>=205) && (firstValueL==255 || nextValueL==255))        
              changesB2I(b,a)=1;
          end
      end
end

end

