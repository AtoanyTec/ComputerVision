clc

img = imread("Lena1.jpg");

imshow(img)

about(img)

img(120,300)

imgRGB = imread("Lena.png");
imshow(imgRGB)
about(imgRGB)

imgRGB(120,250,:)