% Ejemplo 15 - Image Segmentation
% Atoany Fierro

clc
clear all
close all

im = imread('Lena.png');
im_gray = rgb2gray(im);

BW = imbinarize(im_gray, 0.5);

figure(1)
imshowpair(im_gray,BW,'montage')




