%% Ejemplo 6 - Histograma
% Atoany Fierro

clc
clear all
close all

I = imread('pout.tif');

imshow(I)

figure
imhist(I);

[n, v] = imhist(I);








