function [ output_args ] = pruebaAdriana( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

firstImage=rgb2gray(imread('C:\Users\AdrianaPineda\Documents\GitHub\stone-detector\Susana Zapata\Susana Zapata (241).BMP'));

imshow(firstImage);


sizeIn=size(firstImage);

%Obtaining the number of vertical and horizontal pixels of the resulting image
x=sizeIn(1);
y=sizeIn(2);


% Concatenation String
stringAConcatenar='C:\Users\AdrianaPineda\Documents\GitHub\stone-detector\Susana Zapata\Susana Zapata (';



    
    temp=strcat(stringAConcatenar,num2str(241),').BMP');
    actualImage=rgb2gray(imread(temp));
    inext=242;
    nextImage=rgb2gray(imread(strcat(stringAConcatenar,num2str(inext),').BMP')));
          
  for a=1:x
      for b=1:y
          if abs(actualImage(a,b)-nextImage(a,b)) > 50
              
              imshow(nextImage);
              a=x;
              b=y;
          end
      end
  end
end

