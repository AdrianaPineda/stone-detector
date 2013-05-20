function [ changesB2I ] = check_intensity( firstImage, nextImage, x, y, up)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Changes between two images
changesB2I=zeros(x,y);

[bStart, bEnd]=range_b(up);
% a goes from 148 to 232 and b from 155 to 252 (left kydney)
for a=130:255
      for b=bStart:bEnd
          firstValueL=int16(firstImage(b,a));
          nextValueL=int16(nextImage(b,a));
          minusOL=firstValueL-nextValueL;
          if (abs(minusOL) > 55 && (firstValueL>=205|| nextValueL>=205) && (firstValueL==255 || nextValueL==255))        
              changesB2I(b,a)=1;
          end
      end
end


% a goes from 290 to 393 and b from 150 to 257 (right kydney)
for a=256:400
      for b=bStart:bEnd
          firstValueR=int16(firstImage(b,a));
          nextValueR=int16(nextImage(b,a));
          minusOR=firstValueR-nextValueR;   
          if(abs(minusOR) > 55 && (firstValueR>=205|| nextValueR>=205) && (firstValueR==255 || nextValueR==255))
              changesB2I(b,a)=1;
          end
      end
end

end

