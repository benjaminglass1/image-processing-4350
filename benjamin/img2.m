% Creates negative of image && union of original image with constant
% grayscale plane.

im = imread("ImgSkeleton.jpg"); % hard-coded filename by teacher request
gray_im = rgb2gray(im);
neg_im = 255 - gray_im;

% Creates union of original image with grayscale plane at 127
union_im = max(gray_im, 127);

clf;
subplot(1,3,1)
imshow(gray_im)
colormap(gray(256))
title("Original image")
subplot(1,3,2)
imshow(neg_im)
colormap(gray(256))
title("Negative image")
subplot(1,3,3)
imshow(union_im)
colormap(gray(256))
title("Union image")