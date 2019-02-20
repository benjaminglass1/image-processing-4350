im = imread("ImMammogramGS.tif");
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