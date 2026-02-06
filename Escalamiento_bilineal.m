%Escalamiento con interpolación bilineal

clear; clc;
I = imread('.\Imagen_1.jpg'); % Imagen en escala de grises
figure; imshow(I);
I = double(I);
I = 0.2989*I(:,:,1) + 0.5870*I(:,:,2) + 0.1140*I(:,:,3);
I = uint8(I);
figure; imshow(I);
I = double(I);
[m, n] = size(I);
s = 1.5;
ms = round(m*s);
ns = round(n*s);

I_scale = zeros(ms,ns);

for y = 1:ms
    for x = 1:ns
        
        xr = x/s;
        yr = y/s;
        
        if xr>=1 && yr>=1 && xr<=n-1 && yr<=m-1

            x1 = floor(xr); x2 = x1+1;
            y1 = floor(yr); y2 = y1+1;
            
            a = xr - x1;
            b = yr - y1;
            
            I_scale(y,x) = (1-a)*(1-b)*I(y1,x1) + a*(1-b)*I(y1,x2) + (1-a)*b*I(y2,x1) + a*b*I(y2,x2);
        end
    end
end

I_scale = uint8(I_scale);
figure; imshow(I_scale);
