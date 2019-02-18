function out = bit_plane_mask(in,n1)

%in = imread('Img1GS.tif');
%n1 = 1; bit number removed

a=in;
s=255-(2^(n1-1));
b=bitand(a,s);
c=uint8(b);
d=double(a-c);

figure; 
subplot(2,3,1);
imshow(a);
title('Original Image');
subplot(2,3,2);
imshow(c);
title('Bit Plane '+string(n1)+' Removed');
subplot(2,3,3);
imshow(d);
title('Difference of the two');


