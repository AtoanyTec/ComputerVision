% Ejemplo 10 - Remover ruido
% Atoany Fierro

clc
clear all
close all

I = imread('Lena.png');
I_gray = rgb2gray(I);
figure(1)
imshow(I_gray)
title('Imagen original en escala de grises')

J = imnoise(I_gray,'salt & pepper',0.1);
figure(2)
imshow(J)
title('Imagen con ruido')

filtered = medfilt2(J);
figure(3)
imshow(filtered)
title('Imagen sin ruido')

peaksnr = psnr(filtered,I_gray);
