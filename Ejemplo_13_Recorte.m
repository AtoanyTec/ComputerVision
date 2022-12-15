% Ejemplo 13 - Recorte
% Atoany Fierro

clc
clear all
close all

I = imread('llama.jpg');

[J,rect] = imcrop(I);
figure
imshow(J)

I2 = imcrop(I,[75 68 130 112]);
figure
imshow(I2)



