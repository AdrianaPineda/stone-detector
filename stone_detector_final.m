function [ output_image ] = stone_detector_final( num_pacient )
%Algorithm which returns an image with posible kidney stones

%-------------------------------------------------------------------------
% Loading images
%-------------------------------------------------------------------------
disp('- Step 1: loading images');
%Loads the first image from an specific pacient. Remember each pacient
%has different number of images and the first image has not the same number
[index_iS, index_iF, firstImageLoaded, up]=which_pacient(num_pacient);

%Gets the number of vertical and horizontal pixels of the input
x=sizeX(firstImageLoaded);
y=sizeY(firstImageLoaded);

%Creates a new matrix that will have 1s in the pixels that change in
%intensity in the next consecutive image
changes=zeros(x,y);

%-------------------------------------------------------------------------
% Comparing intensities
%-------------------------------------------------------------------------
disp('- Step 2: comparing intensities');
% Compares intensity values between one image and its consecutive image
for i=index_iS:index_iF
    inext=i+1;
    if i==index_iS
        currentImage=toGrayScale(firstImageLoaded);
    else
        currentImage=which_pacient_for(num_pacient, i);
    end
    
    %Loads images. Calls function 'loading_current_next_image'
    if i<index_iF
        nextImage=which_pacient_for(num_pacient, inext);
        %Checks intensity values. Calls function 'check_intensity'
        result=check_intensity(currentImage, nextImage, x, y, up);
        for k=1:x
            for l=1:y
                if(result(k,l)==1)
                    changes(k,l)=1;
                end
            end
        end
    end
end

%Shows the image with pixels with value equal to 1 when the
%imshow(changes);

%-------------------------------------------------------------------------
% Detecting stones
%-------------------------------------------------------------------------
disp('- Step 3: detecting stones');
output_image=itsWorthLooking(changes, x, y, index_iS, index_iF);
imshow(output_image);

end

