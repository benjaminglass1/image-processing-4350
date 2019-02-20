% Calculates and displays negative of 8-bit grayscale image.

im = imread("ImMammogramGS.tif"); % filename hard-coded by teacher request
neg_im = negative(im);

clf;
subplot(1,2,1)
imshow(im)
title("Original image")
subplot(1,2,2)
imshow(neg_im)
title("Negative image")

function y = negative(x)
    y = 255 - x;
end
