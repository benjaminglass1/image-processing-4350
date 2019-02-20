% Demonstrates the effects of bad gamma, and gamma-correction on images.

im = imread("ImRetinaGS.tif"); % filename hard-coded by teacher request
im_badmonitor = gamma_change(im,2.5); % simulate display on monitor with gamma 2.5
im_gammacorrected = gamma_change(im,(1/2.5)); % give image inverse gamma of above monitor
im_correctedmonitor = gamma_change(im_gammacorrected,2.5); % simulate corrected image

clf;
subplot(2,2,1)
imshow(im)
title("Original image")
subplot(2,2,2)
imshow(im_badmonitor)
title("Original, with gamma 2.5")
subplot(2,2,3)
imshow(im_gammacorrected)
title("Gamma-corrected image")
subplot(2,2,4)
imshow(im_correctedmonitor)
title("Gamma-corrected, with gamma 2.5")

function y = gamma_change(x,gamma)
    c = 255/(255^gamma); % Ensures that 255 is the same in both original and corrected image
    y = c * cast(x,'double').^gamma;
    y = cast(round(y),'uint8');
end
