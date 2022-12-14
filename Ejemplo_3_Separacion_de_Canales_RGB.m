%% Ejercicio 3 - Separación de canales RGB
% Atoany Fierro

clc
clear all
close all

img = imread("Lena.png");

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

figure(1)
imshow(R)

figure(2)
imshow(G)

figure(3)
imshow(B)