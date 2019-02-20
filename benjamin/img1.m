gs = imread("~/downloads/Img1GS.tif");
mod_gs = bitset(gs,8,0);

image(mod_gs)
colormap(gray(128))