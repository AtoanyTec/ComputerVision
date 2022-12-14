%% Ejemplo 5 - Video
% Atoany Fierro

clc
clear all
close all

% workingDir = tempname;
% mkdir(workingDir)
% mkdir(workingDir,'images')

shuttleVideo = VideoReader('shuttle.avi');


ii = 1;
while hasFrame(shuttleVideo)
   mov(ii) = im2frame(readFrame(shuttleVideo));
   ii = ii+1;
end

figure 
imshow(mov(1).cdata, 'Border', 'tight')

movie(mov,2,shuttleVideo.FrameRate)

