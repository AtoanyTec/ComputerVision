% Ejemplo 15 - Segmantación basada en color utilizando k-means
% Atoany Fierr
% https://la.mathworks.com/help/images/color-based-segmentation-using-k-means-clustering.html

clc
clear all
close all

he = imread("hestain.png");
imshow(he)
title("H&E Image")
text(size(he,2),size(he,1)+15, ...
     "Image courtesy of Alan Partin, Johns Hopkins University", ...
     FontSize=7,HorizontalAlignment="right")

figure
numColors = 3;
L = imsegkmeans(he,numColors);
B = labeloverlay(he,L);
imshow(B)
title("Labeled Image RGB")

lab_he = rgb2lab(he);

ab = lab_he(:,:,2:3);
ab = im2single(ab);
pixel_labels = imsegkmeans(ab,numColors,NumAttempts=3);

figure
B2 = labeloverlay(he,pixel_labels);
imshow(B2)
title("Labeled Image a*b*")

figure
mask1 = pixel_labels == 1;
cluster1 = he.*uint8(mask1);
imshow(cluster1)
title("Objects in Cluster 1");

figure
mask2 = pixel_labels == 2;
cluster2 = he.*uint8(mask2);
imshow(cluster2)
title("Objects in Cluster 2");

figure
mask3 = pixel_labels == 3;
cluster3 = he.*uint8(mask3);
imshow(cluster3)
title("Objects in Cluster 3");





