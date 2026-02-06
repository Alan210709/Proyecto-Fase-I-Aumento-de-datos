% Volteado (flipping Horizontal)

clear; clc;
I = imread('.\Imagen_5.jpg'); 
figure; imshow(I);
I = double(I);
I = 0.2989*I(:,:,1) + 0.5870*I(:,:,2) + 0.1140*I(:,:,3);
I = uint8(I);
figure; imshow(I);
I = double(I);
[m, n] = size(I);

I_flip = zeros(m,n);

for y = 1:m
    for x = 1:n
        I_flip(y,x) = I(y,n-x+1);
    end
end

I_flip = uint8(I_flip);
figure; imshow(I_flip);
