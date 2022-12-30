% Ejemplo 17 - OCR
% Atoany Fierro

clc
clear all
close all

businessCard   = imread("businessCard.png");
ocrResults     = ocr(businessCard)

recognizedText = ocrResults.Text;    
figure;
imshow(businessCard);
text(600,150,recognizedText,"BackgroundColor",[1 1 1]);







