function [  ] = toGV( imageIn )

%Detecting stones within the ureter
%   Detection is done with 20 medical images selected starting from the
%   middle image of the available

% Loads the first image and converts it to gray scale
carga=rgb2gray(imread('C:\Users\AdrianaPineda\Dropbox\Compartidas\Imagenes\Paciente 4 (Harley Acevedo)\Harley Acevedo (227).BMP'));

%The variable "mitad" is the number of the image from which we start
%looking
mitad=uint16(734/2);
    
% Concatenation String
stringAConcatenar='C:\Users\AdrianaPineda\Dropbox\Compartidas\Imagenes\Paciente 4 (Harley Acevedo)\Harley Acevedo (';

%Looks for the 21 images to be analyzed
%Each image is converted to gray scale and the first image "carga" is
%modified. Each pixel of this image will contain the maximun intensity of
%the overall images (21)
for i=mitad-10:mitad+10
    temp=strcat(stringAConcatenar,num2str(i),').BMP');
    carga=max(rgb2gray(imread(temp)),carga);    
end
    

imageOut=carga;

sizeIn=size(imageOut);

%Obtaining the number of vertical and horizontal pixels of the resulting image
x=sizeIn(1);
y=sizeIn(2);

%Creating a white border
marcoBlanco=uint8(255*ones(x,y));
for i=20:482
    for j=50:393
        marcoBlanco(j,i)=0;
    end
end

%Deleting letters
eliminarLetras=max(imageOut-marcoBlanco,0);

%Thresholding
imageThreshold=255*im2bw(eliminarLetras,0.8);

%Delecting stone with erosion
imageErode = imerode(imageThreshold,strel('disk',4));
imageErode = imdilate(imageErode, strel('disk',4));

imageErode = imageThreshold-imageErode;
imageErode = imerode(imageErode,strel('disk',1));
imageErode = 255*uint8(imdilate(imageErode, strel('disk',1)));


imshow(imageErode);

%Encontrar menor distancia en región del cálculo
posConsCalculoX=0;
posConsCalculoY=0;
for i=1:x
    for j=1:y
        if(imageErode(i,j)~=0)
            posConsCalculoX=j;
            posConsCalculoY=i;
        end
    end
end


%Busca el directorio nuevamente  
for i=mitad-10:mitad+10
    temp=strcat(stringAConcatenar,num2str(i),').BMP');
    carga=max(rgb2gray(imread(temp)),carga);
end


end







