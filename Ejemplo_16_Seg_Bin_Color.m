% Ejemplo 16 - Color Binary Segmentation
% Atoany Fierro

clc
clear all
close all

im = imread("Rubiks.png");

[BW,maskedRGBImage] = createMask(im);

figure
subplot(1,2,1)
imshow(BW)
title('Máscara')
subplot(1,2,2)
imshow(maskedRGBImage)
title('Segmentación')






