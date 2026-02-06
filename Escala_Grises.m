%Transformación a escala de grises

clear; clc;
Im = imread('.\Imagen_5.jpg');
figure; imshow(Im);
Im = double(Im);
Im = 0.2989*Im(:,:,1) + 0.5870*Im(:,:,2) + 0.1140*Im(:,:,3);
Im = uint8(Im);
figure; imshow(Im);
