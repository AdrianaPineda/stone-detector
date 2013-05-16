
rand_num =  int16(rand*(300-230))+230;
luzma=imread(strcat('/home/mono/matlab/stone-detector/Luz Marina Pinzon/Luz Marina Pinzon (',num2str(rand_num),').BMP'));

clc;
disp('===============================');
disp('# Initializing stone-detector #');
disp('===============================');

%{ 
   Step 1: convert from RGB to 0-255
   Given an rgb image with variable name luzma, toGrayScale will transform
   it to a gray value image
%}
original = toGrayScale(luzma);
disp('- Step 1: done gray scaling');

%{
    Setp 2: remove outer black crap
    - cleanAbdomen eliminates the background noise including letters and
    other noise surrounding the abdomen
    - cropBorders will but a 6pixel black border to eliminate the existing
    border
%}
img = cleanAbdomen(original,5);
img = cropBorders(img, 6,6,6,6);
disp('- Step 2: done removing outer black crap');

%{
    Step 3: cropping
    Given that most noise has been eliminated from the image, we will attempt
    to zoom on the abdomen by eliminating the unnecesary image i.e. cutting
    the borders and obtaining a sub image
%}
[x1, x2, y1, y2] = findEdges(img);
img = cropBorders(original, x1,x2,y1,y2);
sub_img = subImage(img, x1, y1, sizeX(img)-x2, sizeY(img)-y2);
disp('- Step 3: done cropping');

%{

    Step 4: use clustering to obtain the different colors
    Having cut the unnecesary borders, we will now find the 4 different
    sections of the image:
        - Outer black: the black color surrounding which gives us no information
        - Abddomen body/skin/fat: the region that covers most of the image
        - Organs: one of our regions of interes, the region that contains
        the organs
        - Bone: the bones (and hopefully the stone!)

%}
tetraColorImage = tetraColor(sub_img);
disp('- Step 4: done clustering');

imshow(tetraColorImage);
onlyOrgans = normalizeColors(tetraColorImage);

imshow(bitand(onlyOrgans,sub_img));













