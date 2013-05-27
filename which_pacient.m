function [ index_iS, index_iF, firstImageLoaded, up] = which_pacient( num_pacient, directory)

%Loads the fisrt image from an specific pacient

% 1: Acevedo, Harley    (from 213-270)
% 2: Pinzon, Luz Marina (from 230-300)
% 3: Romero, John       (from 97-160)
% 4: Zapata, Susana     (from 241-300)

if num_pacient==1
    index_iS=213;
    index_iF=270;
    up=true;
    firstImageLoaded=rgb2gray(loadImageAcevedo(index_iS, directory));
elseif num_pacient==2
    index_iS=230;
    index_iF=300;
    up=false;
    firstImageLoaded=rgb2gray(loadImagePinzon(index_iS, directory));
elseif num_pacient==3
    index_iS=97;
    index_iF=160;
    up=true;
    firstImageLoaded=rgb2gray(loadImageRomero(index_iS, directory));
else
    index_iS=241;
    index_iF=300;
    up=true;
    firstImageLoaded=rgb2gray(loadImageZapata(index_iS, directory));
end

end

