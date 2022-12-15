% Ejemplo 11- Erosión
% Atoany Fierro

clc
clear all
close all

originalBW = imread('text.png');

se = strel('line',11,90);

erodedBW = imerode(originalBW,se);

figure
imshow(originalBW)
title('Imagen original')

figure
imshow(erodedBW)
title('Imagen original')