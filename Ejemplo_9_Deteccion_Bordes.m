% Ejemplo 9 - Detección de bordes
% Atoany Fierro

clc
clear all
close all

I = imread('peppers.png');
I_gray = rgb2gray(I);
figure(1)
imshow(I_gray)
title('Imagen original')

BW1 = edge(I_gray,'Canny');

figure(2)
imshow(BW1)
title('Imagen de bordes')