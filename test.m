function [ changes ] = test( firstImage, nextImage)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

sizeIn=size(firstImage);

%Obtaining the number of vertical and horizontal pixels of the input
%image
x=sizeIn(1);
y=sizeIn(2);

%New matrix
changes=zeros(x,y);

% a goes from 148 to 232 and b from 155 to 252 (left kydney)
for a=130:255
      for b=120:257
          firstValueL=int16(firstImage(b,a));
          nextValueL=int16(nextImage(b,a));
          minusOL=firstValueL-nextValueL;
          if (abs(minusOL) > 55 && (firstValueL>=205|| nextValueL>=205))          
              changes(b,a)=1;
          end
      end
end


% a goes from 290 to 393 and b from 150 to 257 (right kydney)
for a=256:400
      for b=120:257
          firstValueR=int16(firstImage(b,a));
          nextValueR=int16(nextImage(b,a));
          minusOR=firstValueR-nextValueR;   
          if ( abs(minusOR) > 55 && (firstValueR>=205|| nextValueR>=205))
              changes(b,a)=1;
              if(a==354 && b==223)
                disp('acaaaaa');
                disp(firstImage(223,354));
                disp(nextImage(223,354));
              end
          end
      end
end


end

