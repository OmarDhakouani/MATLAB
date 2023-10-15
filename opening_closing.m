clear all; close all ;clc;
%% load two images: one for opening example, another - for closing
img_blobs = imshow("blobs.png");
img_circles = imshow("circles.png");

%%
% define structuring element
str_element = strel("square",3) ;

%%
% IMPLEMENTATION BASED ON OUR FUNCTIONS FROM PREVIOUS EXERCISE
% perform opening/closing using functions from previous exercise
our_opened_blobs = myDilation(myErosion(img_blobs,str_element),str_element);

our_closed_circles = myErosion(myDilation(img_circles,str_element),str_element);

%% plot resuts Opening
figure;
subplot(1,2,1);
imshow(mat2gray(img_blobs),[]); title('Original image');
subplot(1,2,2);
imshow(mat2gray(our_opened_blobs),[]); title('Opening');

%% plot resuts Closing
figure;
subplot(1,2,1);
imshow(mat2gray(img_circles),[]); title('Original image');
subplot(1,2,2);
imshow(mat2gray(our_closed_circles),[]); title('Closing');
