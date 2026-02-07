% CutMix con 5 imágenes

clear; clc;


I{1} = imread('./Imagen_1.jpg');
I{2} = imread('./Imagen_2.jpg');
I{3} = imread('./Imagen_3.jpg');
I{4} = imread('./Imagen_4.jpg');
I{5} = imread('./Imagen_5.jpg');

for k = 1:5
    I{k} = double(I{k});
    I{k} = 0.2989*I{k}(:,:,1) + 0.5870*I{k}(:,:,2) + 0.1140*I{k}(:,:,3);
    I{k} = uint8(I{k});
    figure; imshow(I{k});
    I{k} = double(I{k});
end

[M, N] = size(I{1});
I_cutmix = I{1};
pm = round(0.25*M);
pn = round(0.25*N);

for k = 2:5
    y0 = randi([1 M-pm]);
    x0 = randi([1 N-pn]);

    for y = 0:pm
        for x = 0:pn
            I_cutmix(y0+y, x0+x) = I{k}(y0+y, x0+x);
        end
    end
end

I_cutmix = uint8(I_cutmix);
figure; imshow(I_cutmix);
imwrite(I_cutmix, 'Imagen_Mezclada.jpg');
