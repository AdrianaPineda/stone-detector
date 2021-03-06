function [ ] = stone_detector_final( num_pacient, thickness, directory)
%Algorithm which returns an image with posible kidney stones

%-------------------------------------------------------------------------
% Loading images
%-------------------------------------------------------------------------
disp('- Step 1: loading images');
%Loads the first image from a specific pacient. Remember each pacient
%has different number of images and the first image has not the same number
[index_iS, index_iF, firstImageLoaded, up]=which_pacient(num_pacient, directory);

boneMap = stoner(index_iS, index_iF, num_pacient, directory);

%sets the number of vertical and horizontal pixels of the input
size_x = sizeX(firstImageLoaded);
size_y = sizeY(firstImageLoaded);

%Creates a new matrix that will have 1s in the pixels that change in
%intensity in the next consecutive image
changes=zeros(size_x,size_y);

%-------------------------------------------------------------------------
% Comparing intensities
%-------------------------------------------------------------------------
disp('- Step 2: comparing intensities');

%Borders are cropped
firstImageLoaded = cropBorders(firstImageLoaded, 30,30,30,30);
%Finds edges from image
[x1, x2, y1, y2]=findEdges(firstImageLoaded);
%Obtains L1 and L2 and finds the region of interest (coordinates)
[xStart, xEnd, yStart, yEnd]=range_a_b(up, x1, x2, y1, y2, size_x,size_y);

% Compares intensity values between one image and its consecutive image
for i=index_iS:index_iF-1
    
    if i==index_iS
        currentImage=firstImageLoaded;
    else
        currentImage=getImageFromPacient(num_pacient, i, directory);
    end
    
    %Loads images
    
    nextImage=getImageFromPacient(num_pacient, i+1, directory);
    %Checks intensity values. Calls function 'showIntensityChanges'
    % 
    result=showIntensityChanges(currentImage, nextImage, boneMap, thickness, xStart, xEnd, yStart, yEnd, size_x, size_y);
    % add result to current changes
    changes = changes + result;
end

%-------------------------------------------------------------------------
% Detecting stones
%-------------------------------------------------------------------------
disp('- Step 3: detecting stones');
output_image=itsWorthLooking(changes, size_x, size_y);

%-------------------------------------------------------------------------
% Showing stones
%-------------------------------------------------------------------------
disp('- Step 4: showing stones');
draw_square(changes, num_pacient, size_x, size_y, directory);
end

