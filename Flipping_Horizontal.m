% Volteado (flipping horizontal)

clear; clc;
I = imread('.\Imagen_5.jpg'); 
figure; imshow(I);

% Conversión manual a escala de grises
I = double(I);
I = 0.2989*I(:,:,1) + 0.5870*I(:,:,2) + 0.1140*I(:,:,3);
I = uint8(I);
figure; imshow(I);

I = double(I);
[m, n] = size(I);

I_flip_v = zeros(m,n);

for y = 1:m
    for x = 1:n
        I_flip_v(y,x) = I(m-y+1,x);
    end
end

I_flip_v = uint8(I_flip_v);
figure; imshow(I_flip_v);


