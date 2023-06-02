function solo_hist(im)
%cambiamos imagen escala gris
gris = rgb2gray(im);
%declaramos variables
h = zeros(1,256);
[fil, col] = size(gris);
n = 0 : 255;

%for para leer los valores de la imagen 
%y crear obtener el histograma
for i = 1:fil
    for j = 1 : col 
        h(gris(i,j)+1) = h(gris(i,j)+1)+1;
    end
end
%mostramos imagen original, a escala de gris e histograma
figure,subplot(1,3,1),imshow(im),title('Imagen color');
subplot(1,3,2),imshow(gris),title('Imagen escala gris');
subplot(1,3,3),bar(n,h),title('histograma');
end