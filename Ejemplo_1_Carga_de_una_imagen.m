%% Ejemplo 1 - Carga de una imagen con Matlab
% Atoany Fierro

clc
clear all
close all

img = imread("Lena1.jpg");

imshow(img)

about(img)

img(120,300)

imgRGB = imread("Lena.png");
imshow(imgRGB)
about(imgRGB)

imgRGB(120,250,:)
