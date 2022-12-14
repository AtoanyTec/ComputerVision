clc
clear all
close all

webcamlist

cam = webcam;

preview(cam)

img = snapshot(cam);
imshow(img)