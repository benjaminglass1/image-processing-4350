function out = image_negative_union(in)

%in = imread('ImMammogramGS.tif');
%in=imread('ImgSkeleton.jpg');

b = rgb2gray(in);
bd = double(b);
[m,n] = size(bd);

L=256;
out=bd;

for i = 1:m
    for j = 1:n
        out(i,j) = L-1-out(i,j);        
    end
end

out2 = max(127,b);

out=uint8(out);
%out2=uint8(out);

figure;
subplot(2,3,1);
imshow(in);
subplot(2,3,2);
imshow(out);
subplot(2,3,3);
imshow(out2);

