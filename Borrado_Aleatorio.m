% Borrado aleatorio

clear; clc;
I = imread('./Imagen_5.jpg');
figure; imshow(I);

I = double(I);
I = 0.2989*I(:,:,1) + 0.5870*I(:,:,2) + 0.1140*I(:,:,3);
I = uint8(I);
figure; imshow(I);

I = double(I);
[m, n] = size(I);

erase_m = round(0.2*m);
erase_n = round(0.2*n);

y0 = randi([1, m - erase_m + 1]);
x0 = randi([1, n - erase_n + 1]);

I_erase = I;

for y = y0:(y0 + erase_m - 1)
    for x = x0:(x0 + erase_n - 1)
        I_erase(y,x) = 0;  % negro
    end
end

I_erase = uint8(I_erase);
figure; imshow(I_erase);
imwrite(I_erase, 'Imagen_5_Borrado_Aleatorio.jpg');
