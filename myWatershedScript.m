%%
img = imread('cameraman.tif');
img = mat2gray(img);

%%
[imgWatershed,imgLabel,imgLabelRGB] = myWatershed(img, 25);

%%
figure;
subplot(1,3,1);
imshow(img);
title('Original');
subplot(1,3,2);
imshow(imgWatershed);
title('Segmentation');
subplot(1,3,3);
imshow(label2rgb(imgLabel));
title('Colored segmentation');
