% Ejemplo 14 - Redimensionamiento
% Atoany Fierro

clc
clear all
close all

I = imread("Lena.png");
imshow(I)

Factor = 1.25;
J = imresize(I,Factor);

figure
imshow(J)



