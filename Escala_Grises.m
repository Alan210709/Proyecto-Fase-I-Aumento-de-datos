%Transformación a escala de grises

clear; clc;
Im = imread('C:\Users\Alan_\OneDrive\Imágenes\Álbum de cámara\ss_11942c933c595bf0188d5ee22f6f6a7ed3cdf7d9.1920x1080.jpg');
figure; imshow(Im);
Im = double(Im);
Im = 0.2989*Im(:,:,1) + 0.5870*Im(:,:,2) + 0.1140*Im(:,:,3);
Im = uint8(Im);
figure; imshow(Im);
