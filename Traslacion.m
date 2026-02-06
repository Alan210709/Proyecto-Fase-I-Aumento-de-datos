% Traslación

clear; clc;
I = imread('./Imagen_1.jpg'); 
figure; imshow(I);

I = double(I);
I = 0.2989*I(:,:,1) + 0.5870*I(:,:,2) + 0.1140*I(:,:,3);
I = uint8(I);
figure; imshow(I);

I = double(I);
[m, n] = size(I);

dx = 30;  
dy = 50;   

I_trans = zeros(m,n);

for x = 1:m       
    for y = 1:n  
        xn = x - dx;
        yn = y - dy;

        if xn >= 1 && xn <= m && yn >= 1 && yn <= n
            I_trans(x,y) = I(xn,yn);
        end
    end
end

I_trans = uint8(I_trans);
figure; imshow(I_trans);
