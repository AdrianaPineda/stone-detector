clc;
original = toGrayScale(luzma);
img = cleanAbdomen(original,5);
img = cropBorders(img, 6,6,6,6);

[x1, x2, y1, y2] = findEdges(img);

img = cropBorders(original, x1,x2,y1,y2);

sub_img = subImage(img, x1, y1, sizeX(img)-x2, sizeY(img)-y2);


imshow(sub_img);