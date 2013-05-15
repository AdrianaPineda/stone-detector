function [ img_out ] = clearFat( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    strel_erode = strel('square',6);
    strel_dilate = strel('square',7);
    
    otsu_value = graythresh(img);
    thresh_img = im2bw(img, otsu_value);
    original_thresh = thresh_img;

    thresh_img = imerode(thresh_img, strel_erode);
    thresh_img = imdilate(thresh_img, strel_dilate);
    
    outer_layer = ~min(thresh_img,original_thresh);
    
    img_out = max(0,img-255*uint8(outer_layer));
    
end

