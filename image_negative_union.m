function out = image_negative_union(in)

%in = imread('ImgSkeleton.jpg');

bd = double(in);

L=256;
out=bd;

out = L-1-out;
out2 = max(bd,127);

out2=uint8(out2);
out=uint8(out);

figure;
subplot(2,3,1);
imshow(in);
title('Original Image');
subplot(2,3,2);
imshow(out);
title('Image Negative');
subplot(2,3,3);
imshow(out2);
title('Union of Original and Constant');

