% Ejemplo 12- Dilatación
% Atoany Fierro

clc
clear all
close all

originalBW = imread('text.png');

se = strel('line',11,90);

dilationBW = imdilate(originalBW,se);

figure
imshow(originalBW)
title('Imagen original')

figure
imshow(dilationBW)
title('Imagen dilatada')