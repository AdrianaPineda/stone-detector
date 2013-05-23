function [ changes ] = lookingImages(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

firstImage=rgb2gray(imread('/home/mono/matlab/stone-detector/Susana Zapata/Susana Zapata (241).BMP'));
sizeIn=size(firstImage);
%Obtaining the number of vertical and horizontal pixels of the input
%image
x=sizeIn(1);
y=sizeIn(2);



%New matrix
changes=zeros(x,y);

% Concatenation String
stringAConcatenar='/home/mono/matlab/stone-detector/Susana Zapata/Susana Zapata (';  

for i=241:300
    inext=i+1;
    temp=strcat(stringAConcatenar,num2str(i),').BMP');
    actualImage=rgb2gray(loadImageZapata(i));
  %  if(i==213)
  %      actualImageBones=getBones(actualImage);
  %  end
    if i<300
        temp2=strcat(stringAConcatenar,num2str(inext),').BMP');
        nextImage=rgb2gray(imread(temp2));
        
   %     nextImageBones=getBones(nextImage);        
        result=test(nextImage, actualImage);
        
        for k=1:x
            for l=1:y
                if(result(k,l)==1)
                    changes(k,l)=1;
                end
            end
    
        end
        
   %     actualImageBones=nextImageBones;
    end    
end


for k=1:x
    for l=1:y
        if(changes(k,l)==1)
            disp('changes');
            disp(k);
            disp(l);
        end
    end
    
end

imshow(changes);

end
