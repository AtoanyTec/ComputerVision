% Ejemplo 8 - Suavizado con función Gaussiana
% Atoany Fierro

clc
clear all
close all

I = imread('cameraman.tif');
Iblur1 = imgaussfilt(I,2);

figure
imshow(I)
title('Original image')

figure
imshow(Iblur1)
title('Imagen suavizada, \sigma = 2')