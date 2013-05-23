function [res] = boneIntensityMap(num)
luzma = loadImagePinzon(num);
%luzma = loadRandomImage();

disp(strcat('# generating bone intensity map for: ',num2str(num),' #'));

%{
   Step 1: convert from RGB to 0-255
   Given an rgb image with variable name luzma, toGrayScale will transform
   it to a gray value image
%}
original = rgb2gray(luzma);

%{
    Setp 2: remove outer black crap
    - cleanAbdomen eliminates the background noise including letters and
    other noise surrounding the abdomen
    - cropBorders will but a 6pixel black border to eliminate the existing
    border
%}
img = cleanAbdomen(original,5);
img = cropBorders(img, 6,6,6,6);

%{
    Step 3: Finds the edges of the images and use this information to
    remove any thing lying outside those borders
%}
[x1, x2, y1, y2] = findEdges(img);
img = cropBorders(original, x1,x2,y1,y2);

%{
    Step 4: retreives only the bone part as a binary image with only 0 and
    1
%}
res = getBones(img);
