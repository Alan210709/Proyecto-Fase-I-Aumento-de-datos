clear; clc;
Irgb = imread('.\Imagen_1.jpg');
figure; imshow(Irgb);

% Convertir a grises (luminancia)
I = double(Irgb);
if ndims(I) == 3
    I = 0.2989*I(:,:,1) + 0.5870*I(:,:,2) + 0.1140*I(:,:,3);
end
I = uint8(I);
figure; imshow(I);

I = double(I);
[m, n] = size(I);

theta = 90*pi/180;  % 90 grados
I_rot = zeros(m,n);

cx = (n+1)/2;
cy = (m+1)/2;

for y = 1:m
    for x = 1:n

        % Mapeo inverso (R(-theta))
        xr =  cos(theta)*(x-cx) + sin(theta)*(y-cy) + cx;
        yr = -sin(theta)*(x-cx) + cos(theta)*(y-cy) + cy;

        % Condición bilineal
        if xr >= 1 && yr >= 1 && xr <= (n-1) && yr <= (m-1)

            x1 = floor(xr); x2 = x1+1;
            y1 = floor(yr); y2 = y1+1;

            a = xr - x1;
            b = yr - y1;

            I_rot(y,x) = (1-a)*(1-b)*I(y1,x1) + a*(1-b)*I(y1,x2) ...
                         + (1-a)*b*I(y2,x1) + a*b*I(y2,x2);
        end
    end
end

I_rot = uint8(I_rot);
figure; imshow(I_rot);
