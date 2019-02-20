% Displays an image with four different gammas

im = imread("ImAerialGS.tif"); % filename hardcoded by teacher request
[corrected3,corrected4,corrected5] = gamma_correction(im,3,4,5);

clf;
subplot(2,2,1)
imshow(im)
title("Original image")
subplot(2,2,2)
imshow(corrected3)
title("Gamma = 3.0")
subplot(2,2,3)
imshow(corrected4)
title("Gamma = 4.0")
subplot(2,2,4)
imshow(corrected5)
title("Gamma = 5.0")

function [im1,im2,im3] = gamma_correction(x,gamma1,gamma2,gamma3)
    % ensures that 255 is consistent between original and modified image
    c1 = 255/(255^gamma1);
    c2 = 255/(255^gamma2);
    c3 = 255/(255^gamma3);

    im1 = c1 * cast(x,'double').^gamma1;
    im1 = cast(round(im1),'uint8');
    im2 = c2 * cast(x,'double').^gamma2;
    im2 = cast(round(im2),'uint8');
    im3 = c3 * cast(x,'double').^gamma3;
    im3 = cast(round(im3),'uint8');
end
