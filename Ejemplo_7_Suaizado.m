%% Ejemplo 7 - Suavizado
% Atoany Fierro

clc
clear all
close all

K = ones(21,21) / (21^2);

img = imread('cameraman.tif');
figure(1)
imshow(img)

result = conv2(img, K);

result = uint8(result);
figure(2)
imshow(result)

